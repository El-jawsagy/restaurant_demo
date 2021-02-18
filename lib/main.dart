import 'package:flutter/material.dart';
import 'package:max_flutter_app_section_seven/screens/meal_details_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final namedRoute = "/";
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
      home: CategoriesScreen(),
      routes: {
        CategoriesScreen.namedRoute: (ctx) => CategoriesScreen(),
        CategoryMealsScreen.namedRoute: (ctx) => CategoryMealsScreen(),
        MealDetailsScreen.namedRoute: (ctx) => MealDetailsScreen(),
      },
      onUnknownRoute: (setting) {
        print(setting);
        return MaterialPageRoute(
          builder: (ctx) => CategoriesScreen(),
        );
      },
    );
  }
}
