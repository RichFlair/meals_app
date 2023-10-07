import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/favourites_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/bottom_nav_bar.dart';
import 'screens/category_meals_screen.dart';
import 'screens/categories_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegegtarian': false,
  };

  List<Meal> availableMeals = dummyMeals;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      filters = filterData;
      availableMeals.where((meal) {
        if (filters['gluten']! && !meal.isGlutenFree) {
          return false;
        }
        if (filters['lactose']! && !meal.isLactoseFree) {
          return false;
        }
        if (filters['vegan']! && !meal.isVegan) {
          return false;
        }
        if (filters['vegetarian']! && !meal.isVegetarian) {
          return false;
        }
        return true;
      });
    });
  }

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
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      // home: const Categories(),
      routes: {
        '/': (context) => const BottomNavBar(),
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(currentMeals: availableMeals),
        MealDetailScreen.routeName: (context) => const MealDetailScreen(),
        FiltersScreen.routeName: (context) => FiltersScreen(setFilters: _setFilters),
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
