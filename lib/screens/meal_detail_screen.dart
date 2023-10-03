import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  const MealDetailScreen({super.key});

  Widget tileLabel(String text, BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }

  Widget displayContainer(Widget child) {
    return Container(
      height: 170,
      width: 350,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = dummyMeals.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.network(
              selectedMeal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          tileLabel('Ingredients', context),
          displayContainer(
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.all(5),
                      color: Colors.amber,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          selectedMeal.ingredients[index],
                        ),
                      ),
                    );
                  },
                  itemCount: selectedMeal.ingredients.length),
            ),
          ),
          tileLabel('Steps', context),
          displayContainer(
            ListView.builder(
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${index + 1}'),
                      ),
                      title: Text(
                        selectedMeal.steps[index],
                      ),
                    ),
                    const Divider(thickness: 2, color: Colors.black54),
                  ],
                );
              },
              itemCount: selectedMeal.steps.length,
            ),
          )
        ],
      ),
    );
  }
}
