import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;

  final String title;
  final Color catItemColor;
  const CategoryItem(
      {Key key,
      @required this.id,
      @required this.title,
      @required this.catItemColor})
      : super(key: key);

  void _selectCategoryItemMeals({
    BuildContext ctx,
  }) {
    // Navigator.of(ctx).push(
    //   CupertinoPageRoute(
    //     builder: (_) => CategoryMealsScreen(
    //       idCatScreen: id,
    //       titleCatScreen: title,

    //     ),
    //   ),
    // );

    Navigator.of(ctx).pushNamed(
      CategoryMealsScreen.namedRoute,
      arguments: {
        "id": id,
        "title": title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategoryItemMeals(
        ctx: context,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: RadialGradient(
            colors: [
              catItemColor.withOpacity(0.7),
              catItemColor,
            ],
          ),
        ),
        child: Center(child: Text(title)),
      ),
    );
  }
}
