import 'package:flutter/material.dart';

class DescriptionLabel extends StatelessWidget {
  const DescriptionLabel({
    super.key,
    required this.duration,
    required this.mealAffordabilityText,
    required this.mealComplexityText,
  });

  final int duration;
  final String mealAffordabilityText;
  final String mealComplexityText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              const Icon(Icons.timer),
              const SizedBox(
                width: 5,
              ),
              Text('$duration mins')
            ],
          ),
          Row(
            children: [
              const Icon(Icons.work),
              const SizedBox(
                width: 5,
              ),
              Text(mealAffordabilityText)
            ],
          ),
          Row(
            children: [
              const Icon(Icons.attach_money_outlined),
              const SizedBox(
                width: 5,
              ),
              Text(mealComplexityText)
            ],
          )
        ],
      ),
    );
  }
}