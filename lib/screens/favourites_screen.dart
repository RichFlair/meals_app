import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  static const routeName = '/favourites';
  const FavouritesScreen({
    super.key,
    required this.favoriteMeals,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      body: favoriteMeals.isEmpty
          ? const Center(
              child: Text('No Favourites added'),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return MealItem(
                  id: favoriteMeals[index].id,
                  title: favoriteMeals[index].title,
                  imageUrl: favoriteMeals[index].imageUrl,
                  duration: favoriteMeals[index].duration,
                  complexity: favoriteMeals[index].complexity,
                  affordability: favoriteMeals[index].affordability,
                );
              },
              itemCount: favoriteMeals.length,
            ),
    );
  }
}
