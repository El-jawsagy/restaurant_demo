import 'package:flutter/material.dart';

class MealDetailsScreen extends StatelessWidget {
  static const namedRoute = "/mealDetails";

  const MealDetailsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(" $mealId "),
        ),
        body: Text("meal id is $mealId "),
      ),
    );
  }
}
