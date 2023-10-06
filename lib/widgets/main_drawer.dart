import 'package:flutter/material.dart';
import 'package:meals_app/screens/favourites_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget drawerItems(BuildContext context, String title, IconData icon,
      Function navigateScreen) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () => navigateScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 80),
              child: const Text(
                'Cooking!',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
                // textAlign: TextAlign.center,
              ),
            ),
          ),
          drawerItems(
            context,
            'Meals',
            Icons.restaurant,
            () {
              Navigator.of(context).popAndPushNamed('/');
            },
          ),
          const Divider(),
          drawerItems(
            context,
            'Filters',
            Icons.settings,
            () {
              Navigator.of(context).popAndPushNamed(FiltersScreen.routeName);
            },
          ),
          const Divider(),
          drawerItems(
            context,
            'Favourites',
            Icons.favorite,
            () {
              Navigator.of(context).popAndPushNamed(FavouritesScreen.routeName);
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}
