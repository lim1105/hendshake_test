import 'package:flutter/material.dart';
import 'package:hendshake_test/models/activity_model.dart';
import 'package:hendshake_test/widgets/activity_widget.dart';

class HistoryScreen extends StatefulWidget {
  final List<ActivityModel> historyActivities;
  final String? selectedActivityType;

  const HistoryScreen({super.key, required this.historyActivities, this.selectedActivityType});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ListView.builder(
          itemCount: widget.historyActivities.length,
          itemBuilder: (context, index) {
            final activity = widget.historyActivities[index];
            return Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: index == 0 ? 16 : 0,
                bottom: 16,
              ),
              child: ActivityWidget(
                activity: activity,
                selectActivityType: widget.selectedActivityType,
              ),
            );
          },
        ),
      ),
    );
  }
}
