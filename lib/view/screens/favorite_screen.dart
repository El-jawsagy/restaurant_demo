import 'package:flutter/material.dart';
import '../../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  final Function removeItemFromList;
  FavoriteScreen({Key key, this.favoriteMeals, this.removeItemFromList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Container(
          child: Text("Favorites Meals"),
        ),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: favoriteMeals[index].id,
            title: favoriteMeals[index].title,
            imageUrl: favoriteMeals[index].imageUrl,
            complexity: favoriteMeals[index].complexity,
            price: favoriteMeals[index].price,
            duration: favoriteMeals[index].duration,
            steps: favoriteMeals[index].steps,
            components: favoriteMeals[index].components,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
