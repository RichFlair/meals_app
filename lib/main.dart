import 'package:flutter/material.dart';
import './category_meals_screen.dart';
import './categories_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Awesome Meals',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        canvasColor: Colors.blue.shade50,
        fontFamily: 'Raleway',
        // Text theme config
        textTheme: ThemeData.light().textTheme.copyWith(
              // body (Large) theme config
              bodyLarge: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              // title (Large) theme config
              titleLarge: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      home: const Categories(),
      routes: {
        '/category-meals': (context) =>
            const CategoryMealsScreen()
      },
    );
  }
}
