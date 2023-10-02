import 'package:flutter/material.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';

import '../widgets/meal_item_image.dart';
import '../widgets/description_label.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem({
    super.key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
  });

  String get mealComplexityText {
    switch (complexity) {
      case Complexity.challanging:
        return 'Challenging';
      case Complexity.difficult:
        return 'Difficult';
      case Complexity.simple:
        return 'Simple';
      default:
        return 'Unknown';
    }
  }

  String get mealAffordabilityText {
    switch (affordability) {
      case Affordability.affordable:
        return 'Affordable';
      case Affordability.luxurious:
        return 'Expensive';
      case Affordability.pricey:
        return 'Pricey';
      default:
        return 'Unknown';
    }
  }

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealDetailScreen.routeName, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.all(10),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Column(
          children: [
            MealItemImage(imageUrl: imageUrl, title: title),
            DescriptionLabel(
              duration: duration,
              mealAffordabilityText: mealAffordabilityText,
              mealComplexityText: mealComplexityText,
            ),
          ],
        ),
      ),
    );
  }
}
