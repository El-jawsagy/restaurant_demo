import 'package:flutter/material.dart';
import '../../view/widgets/main_drawer.dart';

import './categories_screen.dart';
import './favorite_screen.dart';
import '../../models/meal.dart';

class TabDeciderScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabDeciderScreen({Key key, this.favoriteMeals}) : super(key: key);

  @override
  _TabDeciderScreenState createState() => _TabDeciderScreenState();
}

class _TabDeciderScreenState extends State<TabDeciderScreen> {
  int _selectedIndex = 0;
  List<Map<String, Object>> _pages;
  @override
  void initState() {
    _pages = [
      {
        "page": CategoriesScreen(),
        "title": "Meal Categories",
      },
      {
        "page": FavoriteScreen(
          favoriteMeals: widget.favoriteMeals,
        ),
        "title": "Favorite",
      },
    ];

    super.initState();
  }

  void _tapedToUpdateIndex(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            _pages[_selectedIndex]["title"],
          ),
        ),
        drawer: SameDrawer(),
        body: _pages[_selectedIndex]["page"],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          onTap: _tapedToUpdateIndex,
          type: BottomNavigationBarType.shifting,
          selectedItemColor: Color(0xffffefa1),
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(
                Icons.category,
              ),
              label: "Categories",
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(
                Icons.favorite,
              ),
              label: "Favorite",
            ),
          ],
        ),
      ),
    );
  }
}
