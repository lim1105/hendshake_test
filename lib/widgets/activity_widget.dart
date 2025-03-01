import 'package:flutter/material.dart';
import 'package:hendshake_test/models/activity_model.dart';

class ActivityWidget extends StatelessWidget {
  final ActivityModel? activity;
  final String? selectActivityType;

  const ActivityWidget({super.key, required this.activity, this.selectActivityType});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: 16,
      ),
      decoration: BoxDecoration(
        color: selectActivityType == null
            ? null
            : selectActivityType == activity?.type
                ? Colors.yellow
                : null,
        border: Border.all(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('activity: ${activity?.activity ?? '-'}'),
          Text('price: ${activity?.price.toString() ?? '-'}'),
        ],
      ),
    );
  }
}
