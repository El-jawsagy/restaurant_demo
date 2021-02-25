import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const String namedRoute = "/categoryMeals";
  final List<Meal> availableMeal;

  const CategoryMealsScreen({Key key, this.availableMeal}) : super(key: key);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String titleCatScreen;
  String idCatScreen;
  List<Meal> displayCategoryMeals;
  bool _loading = false;

  void removeItemFromList(mealId) {
    setState(() {
      displayCategoryMeals.removeWhere((meal) {
        return meal.id == mealId;
      });
    });
  }

  @override
  void didChangeDependencies() {
    if (!_loading) {
      final argumentRouteValue =
          ModalRoute.of(context).settings.arguments as Map<String, String>;

      titleCatScreen = argumentRouteValue["title"];
      idCatScreen = argumentRouteValue["id"];
      displayCategoryMeals = widget.availableMeal.where((meal) {
        return meal.categories.contains(idCatScreen);
      }).toList();
      _loading = true;
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleCatScreen),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
              id: displayCategoryMeals[index].id,
              title: displayCategoryMeals[index].title,
              imageUrl: displayCategoryMeals[index].imageUrl,
              complexity: displayCategoryMeals[index].complexity,
              price: displayCategoryMeals[index].price,
              duration: displayCategoryMeals[index].duration,
              steps: displayCategoryMeals[index].steps,
              components: displayCategoryMeals[index].components,
            );
          },
          itemCount: displayCategoryMeals.length,
        ),
      ),
    );
  }
}
