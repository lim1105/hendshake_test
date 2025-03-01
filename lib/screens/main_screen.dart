import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hendshake_test/models/activity_model.dart';
import 'package:hendshake_test/screens/history_screen.dart';
import 'package:hendshake_test/utils/shared_preferences_helper.dart';
import 'package:hendshake_test/widgets/activity_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<ActivityModel> _historyActivities = [];
  String? _selectedActivityType;

  ActivityModel? _activity;

  final List<String> _activityTypes = [
    "education",
    "recreational",
    "social",
    "diy",
    "charity",
    "cooking",
    "relaxation",
    "music",
    "busywork"
  ];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    _selectedActivityType = await SharedPreferencesHelper().getSelectedActivityType();
    _historyActivities = await SharedPreferencesHelper().getHistoryActivities();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Wrap(
                spacing: 8,
                children: List.generate(_activityTypes.length, (index) {
                  final activityType = _activityTypes[index];
                  return ChoiceChip(
                    label: Text(activityType),
                    selected: _selectedActivityType == activityType,
                    onSelected: (value) async {
                      setState(() {
                        if (_selectedActivityType == activityType) {
                          _selectedActivityType = null;
                        } else {
                          _selectedActivityType = activityType;
                        }
                      });
                      await SharedPreferencesHelper().setSelectedActivityType(_selectedActivityType);
                    },
                  );
                }),
              ),
              ActivityWidget(activity: _activity),
              OutlinedButton(
                child: const Text('next'),
                onPressed: () async {
                  final dio = Dio();
                  final response = await dio.get(
                    'https://bored.api.lewagon.com/api/activity',
                    queryParameters: _selectedActivityType != null ? {'type': _selectedActivityType} : null,
                  );
                  final activity = ActivityModel.fromJson(response.data);

                  if (_historyActivities.length >= 50) {
                    _historyActivities.removeLast();
                  }
                  _historyActivities.insert(0, activity);

                  await SharedPreferencesHelper().setHistoryActivities(_historyActivities);

                  setState(() => _activity = activity);
                },
              ),
              OutlinedButton(
                child: const Text('history'),
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HistoryScreen(
                        historyActivities: _historyActivities,
                        selectedActivityType: _selectedActivityType,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
