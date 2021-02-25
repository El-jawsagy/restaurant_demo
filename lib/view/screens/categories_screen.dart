import 'package:flutter/material.dart';
import '../../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  static const namedRoute = "/categories";
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(8.0),
      children: DUMMY_CATEGORIES
          .map(
            (catData) => CategoryItem(
              id: catData.id,
              title: catData.title,
              catItemColor: catData.color,
            ),
          )
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
      ),
    );
  }
}
