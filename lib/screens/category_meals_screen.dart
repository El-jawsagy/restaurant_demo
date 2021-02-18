import 'package:flutter/material.dart';
import 'package:max_flutter_app_section_seven/dummy_data.dart';
import 'package:max_flutter_app_section_seven/widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const String namedRoute = "/categoryMeals";
  // final String idCatScreen;
  // final String titleCatScreen;

  // const CategoryMealsScreen({
  //   Key key,
  //   @required this.idCatScreen,
  //   @required this.titleCatScreen,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final argumentRouteValue =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    String titleCatScreen = argumentRouteValue["title"];
    String idCatScreen = argumentRouteValue["id"];

    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(idCatScreen);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(titleCatScreen),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
              id: categoryMeals[index].id,
              title: categoryMeals[index].title,
              imageUrl: categoryMeals[index].imageUrl,
              complexity: categoryMeals[index].complexity,
              price: categoryMeals[index].price,
              duration: categoryMeals[index].duration,
            );
          },
          itemCount: categoryMeals.length,
        ),
      ),
    );
  }
}
