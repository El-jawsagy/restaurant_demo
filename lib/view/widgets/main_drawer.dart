import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class SameDrawer extends StatelessWidget {
  const SameDrawer({Key key}) : super(key: key);

  Widget _builderDrawerButtonItem(
      String title, IconData icon, Function function) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontFamily: "RebotoCondensed",
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: function,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 0.7,
                  spreadRadius: 0.9,
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Meal Recipes",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                      fontFamily: "RebotoCondensed",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          _builderDrawerButtonItem(
            "Meals",
            Icons.category,
            () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          _builderDrawerButtonItem(
            "Filter",
            Icons.settings,
            () {
              Navigator.pushReplacementNamed(
                context,
                FiltersScreen.namedRoute,
              );
            },
          ),
        ],
      ),
    );
  }
}
