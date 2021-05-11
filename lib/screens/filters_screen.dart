import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const filters = "/filters";
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  const FiltersScreen(this.currentFilters, this.saveFilters);
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  bool _lactoseFree = false;
  Widget _buidSwitch(
    String title,
    String subtitle,
    bool curValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: curValue,
      subtitle: Text(subtitle),
      onChanged: updateValue,
    );
  }

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegitarian'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilter = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegitarian': _vegetarian,
              };
              widget.saveFilters(selectedFilter);
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your meal section",
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buidSwitch("Gluten Free", "Only includes gluten free meals",
                    _glutenFree, (value) {
                  setState(() {
                    _glutenFree = value;
                  });
                }),
                _buidSwitch("Vegan", "Only includes vegan meals", _vegan,
                    (value) {
                  setState(() {
                    _vegan = value;
                  });
                }),
                _buidSwitch(
                    "Vegetarian", "Only includes Vegetarian meals", _vegetarian,
                    (value) {
                  setState(() {
                    _vegetarian = value;
                  });
                }),
                _buidSwitch("Lactose Free", "Only includes Lactose free meals",
                    _lactoseFree, (value) {
                  setState(() {
                    _lactoseFree = value;
                  });
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
