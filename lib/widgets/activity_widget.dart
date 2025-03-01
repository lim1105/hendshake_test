import 'package:flutter/material.dart';
import 'package:hendshake_test/models/activity_model.dart';

class ActivityWidget extends StatelessWidget {
  final ActivityModel? activity;
  final String? selectActivityType;
  final String? number;

  const ActivityWidget({super.key, required this.activity, this.selectActivityType, this.number});

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
      child: Row(
        children: [
          if (number != null) ...[
            Text(number!),
          ],
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('activity: ${activity?.activity ?? '-'}'),
                Text('price: ${activity?.price.toString() ?? '-'}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
