import 'dart:convert';

import 'package:hendshake_test/constants/constants.dart';
import 'package:hendshake_test/models/activity_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  Future<void> setHistoryActivities(List<ActivityModel> historyActivities) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(
      SharedPreferencesKey.historyActivities,
      jsonEncode(historyActivities),
    );
  }

  Future<List<ActivityModel>> getHistoryActivities() async {
    final pref = await SharedPreferences.getInstance();
    final string = pref.getString(SharedPreferencesKey.historyActivities);
    List<ActivityModel> historyActivities = [];
    if (string != null) {
      final dataList = jsonDecode(string);
      for (final data in dataList) {
        historyActivities.add(ActivityModel.fromJson(data));
      }
    }
    return historyActivities;
  }

  Future<void> setSelectedActivityType(String? selectedActivityType) async {
    final pref = await SharedPreferences.getInstance();
    if (selectedActivityType == null) {
      await pref.remove(SharedPreferencesKey.selectedActivityType);
    } else {
      await pref.setString(
        SharedPreferencesKey.selectedActivityType,
        selectedActivityType,
      );
    }
  }

  Future<String?> getSelectedActivityType() async {
    final pref = await SharedPreferences.getInstance();
    final selectedActivityType = pref.getString(SharedPreferencesKey.selectedActivityType);
    return selectedActivityType;
  }
}
