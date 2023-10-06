import 'package:flutter/material.dart';
import 'package:meals_app/screens/favourites_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/bottom_nav_bar.dart';
import 'screens/category_meals_screen.dart';
import 'screens/categories_screen.dart';

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
          secondary: Colors.orange,
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
      // home: const Categories(),
      routes: {
        '/': (context) => const BottomNavBar(),
        CategoryMealsScreen.routeName: (context) => const CategoryMealsScreen(),
        MealDetailScreen.routeName: (context) => const MealDetailScreen(),
        FiltersScreen.routeName: (context) => const FiltersScreen(),
        FavouritesScreen.routeName: (context) => const FavouritesScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const CategoriesScreen(),
        );
      },
    );
  }
}
