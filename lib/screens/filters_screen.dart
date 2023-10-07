import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool isGlutenFree = false;
  bool isLactoseFree = false;
  bool isVegetarian = false;
  bool isVegan = false;

  Widget switchListItem(
    String title,
    String subtitle,
    bool handler,
    Function(bool) turnSwitch,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: handler,
      onChanged: turnSwitch,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            alignment: Alignment.center,
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                switchListItem(
                  'Gluten-free',
                  'Only gluten-free meals',
                  isGlutenFree,
                  (value) {
                    setState(() {
                      isGlutenFree = value;
                    });
                  },
                ),
                const Divider(),
                switchListItem(
                  'Lactose-free',
                  'Only lactose-free meals',
                  isLactoseFree,
                  (value) {
                    setState(() {
                      isLactoseFree = value;
                    });
                  },
                ),
                const Divider(),
                switchListItem(
                  'Vegetarian',
                  'Only vegetarian meals',
                  isVegetarian,
                  (value) {
                    setState(() {
                      isVegetarian = value;
                    });
                  },
                ),
                const Divider(),
                switchListItem(
                  'Vegan',
                  'Only vegan meals',
                  isVegan,
                  (value) {
                    setState(() {
                      isVegan = value;
                    });
                  },
                ),
                const Divider(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
