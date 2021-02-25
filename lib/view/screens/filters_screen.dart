import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import '../../models/filter.dart';

class FiltersScreen extends StatefulWidget {
  static const namedRoute = "/filters";
  Filter currentFilter;
  Function updateCurrentFilter;

  FiltersScreen({Key key, this.currentFilter, this.updateCurrentFilter})
      : super(key: key);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _lactoseFree = false;
  bool _glutenFree = false;
  bool _veganFree = false;
  bool _vegetarianFree = false;
  @override
  void initState() {
    super.initState();
    _lactoseFree = widget.currentFilter.lactose;
    _glutenFree = widget.currentFilter.gluten;
    _veganFree = widget.currentFilter.vegan;
    _vegetarianFree = widget.currentFilter.vegetarian;
  }

  Widget _buildSwitchListTitle({
    String title,
    subtitle,
    bool value,
    Function updateValue,
  }) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        value: value,
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () => widget.updateCurrentFilter(
              Filter(
                lactose: _lactoseFree,
                gluten: _glutenFree,
                vegan: _veganFree,
                vegetarian: _vegetarianFree,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Text(
              "Here you can custom meal you want to shown.",
              style: Theme.of(
                context,
              ).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTitle(
                  title: "Lactose Free",
                  subtitle: "only meals this contain lactose.",
                  value: _lactoseFree,
                  updateValue: (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                ),
                _buildSwitchListTitle(
                  title: "Gluten Free",
                  subtitle: "only meals this contain Gluten.",
                  value: _glutenFree,
                  updateValue: (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                _buildSwitchListTitle(
                  title: "Vegan",
                  subtitle: "only Vegan meals will appear.",
                  value: _veganFree,
                  updateValue: (newValue) {
                    setState(() {
                      _veganFree = newValue;
                    });
                  },
                ),
                _buildSwitchListTitle(
                  title: "Vegetarian",
                  subtitle: "only Vegetarian meals will appear.",
                  value: _vegetarianFree,
                  updateValue: (newValue) {
                    setState(() {
                      _vegetarianFree = newValue;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
      drawer: SameDrawer(),
    );
  }
}
