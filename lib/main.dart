import 'package:flutter/material.dart';
import 'package:max_flutter_app_section_seven/dummy_data.dart';
import 'package:max_flutter_app_section_seven/models/filter.dart';
import './view/screens/filters_screen.dart';
import './view/screens/taps_decider_screen.dart';
import './view/screens/meal_details_screen.dart';
import './view/screens/category_meals_screen.dart';
import './models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Filter _filter = Filter(
    lactose: false,
    gluten: false,
    vegan: false,
    vegetarian: false,
  );

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  ///this function is to update

  void _updateCurrentFilter(Filter filter) {
    setState(() {
      _filter = filter;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (filter.lactose && !meal.isLactoseFree) {
          return false;
        }
        if (filter.gluten && !meal.isGlutenFree) {
          return false;
        }
        if (filter.vegan && !meal.isVegan) {
          return false;
        }
        if (filter.vegetarian && !meal.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavoriteMeal(mealId) {
    final currentIndex = _favoriteMeals.indexWhere((meal) {
      return meal.id == mealId;
    });
    if (currentIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(currentIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isFavorited(mealId) {
    return _favoriteMeals.any((meal) {
      return meal.id == mealId;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.teal,
        accentColor: Colors.tealAccent,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: "Raleway",
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontSize: 24,
                fontFamily: "RebotoCondensed",
                fontWeight: FontWeight.bold,
              ),
              bodyText1: TextStyle(
                color: Color.fromRGBO(
                  20,
                  51,
                  51,
                  1,
                ),
                fontFamily: "RebotoCondensed",
                fontWeight: FontWeight.bold,
              ),
              bodyText2: TextStyle(
                fontSize: 20,
                fontFamily: "RebotoCondensed",
                fontWeight: FontWeight.bold,
              ),
            ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: "/",
      routes: {
        '/': (ctx) => TabDeciderScreen(favoriteMeals: _favoriteMeals),
        CategoryMealsScreen.namedRoute: (ctx) => CategoryMealsScreen(
              availableMeal: this._availableMeals,
            ),
        MealDetailsScreen.namedRoute: (ctx) => MealDetailsScreen(
              favoriteHandle: _toggleFavoriteMeal,
              isFavorite: _isFavorited,
            ),
        FiltersScreen.namedRoute: (ctx) => FiltersScreen(
              currentFilter: this._filter,
              updateCurrentFilter: this._updateCurrentFilter,
            ),
      },
      onUnknownRoute: (setting) {
        print(setting);
        return MaterialPageRoute(
          builder: (ctx) => TabDeciderScreen(favoriteMeals: _favoriteMeals),
        );
      },
    );
  }
}
