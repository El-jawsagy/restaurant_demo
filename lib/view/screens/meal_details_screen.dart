import 'package:flutter/material.dart';

class MealDetailsScreen extends StatelessWidget {
  static const namedRoute = "/mealDetails";
  final Function favoriteHandle;
  final Function isFavorite;

  MealDetailsScreen({
    Key key,
    this.favoriteHandle,
    this.isFavorite,
  }) : super(key: key);

  Widget _buildHeaderWidget(string) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            string,
          ),
        ],
      ),
    );
  }

  Widget _buildBodyOfHeader({ctx, Widget childBody}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey)),
          width: MediaQuery.of(ctx).size.width * 0.8,
          height: MediaQuery.of(ctx).size.height * 0.3,
          child: childBody),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealDetails =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: Text(" ${mealDetails["title"]}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              "${mealDetails["imageUrl"]}",
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.25,
              fit: BoxFit.cover,
            ),
            _buildHeaderWidget("Meal Components"),
            _buildBodyOfHeader(
              ctx: context,
              childBody: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: BoxDecoration(
                      color: Color(0xffffcb91),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListTile(
                      title: Text(
                        mealDetails["components"][index],
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  );
                },
                itemCount: mealDetails["components"].length,
              ),
            ),
            _buildHeaderWidget("Meal Steps"),
            _buildBodyOfHeader(
              ctx: context,
              childBody: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: ListTile(
                      leading: CircleAvatar(
                          backgroundColor: Color(0xffffefa1),
                          child: Text(
                            "# ${index + 1}",
                            style: Theme.of(context).textTheme.bodyText1,
                            textAlign: TextAlign.center,
                          )),
                      title: Text(
                        mealDetails["steps"][index],
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  );
                },
                itemCount: mealDetails["steps"].length,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavorite(mealDetails["id"])
              ? Icons.favorite
              : Icons.favorite_border,
        ),
        onPressed: () => favoriteHandle(mealDetails["id"]),
      ),
    );
  }
}
