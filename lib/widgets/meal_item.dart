import 'package:flutter/material.dart';
import 'package:max_flutter_app_section_seven/models/meal.dart';
import 'package:max_flutter_app_section_seven/screens/meal_details_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final Complexity complexity;
  final Price price;
  final int duration;

  const MealItem({
    Key key,
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.complexity,
    @required this.price,
    @required this.duration,
  }) : super(key: key);

  String get mealCost {
    switch (complexity) {
      case Complexity.Simple:
        return "Easy";
        break;
      case Complexity.Challenging:
        return "Challenging";
        break;
      case Complexity.Hard:
        return "Hard";
        break;
      default:
        return "unKown";
    }
  }

  String get mealComplexity {
    switch (price) {
      case Price.Affordable:
        return "Affordable";
        break;
      case Price.Pricey:
        return "Pricey";
        break;
      case Price.HighPricey:
        return "Expensive";
        break;
      default:
        return "unKown";
    }
  }

  void navToDisplayMeal(BuildContext ctx) {
    Navigator.pushNamed(
      ctx,
      MealDetailsScreen.namedRoute,
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 6,
      child: InkWell(
        onTap: () => navToDisplayMeal(context),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black54,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 16,
                      ),
                      child: Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.schedule,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        "$duration min",
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.work,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        mealComplexity,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.attach_money,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        mealCost,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
