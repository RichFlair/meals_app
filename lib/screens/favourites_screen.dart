import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FavouritesScreen extends StatelessWidget {
  static const routeName = '/favourites';
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourites'),
      ),
      drawer: const MainDrawer(),
      body: const Center(
        child: Text('Favourites'),
      ),
    );
  }
}
