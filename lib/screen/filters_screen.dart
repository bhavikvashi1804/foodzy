import 'package:flutter/material.dart';
import '../widget/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const String routeName = '/filters';
  final Function setFilter;
  final Map<String,bool> cFilters;

  FilterScreen(this.cFilters,this.setFilter);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _isVegetarian = false;
  bool _isVegan = false;
  bool _isGluten = false;
  bool _lactoseFree = false;


  @override
  void initState() {

    //to load stored switch value 
    _isVegan=widget.cFilters['vegan'];
    _isGluten=widget.cFilters['gluten'];
    _isVegetarian=widget.cFilters['veg'];
    _lactoseFree=widget.cFilters['lactose'];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save), 
            onPressed:(){

              final savefilters={
                'gluten':_isGluten,
                'veg':_isVegetarian,
                'lactose':_lactoseFree,
                'vegan':_isVegan,
              };
              widget.setFilter(savefilters);

              print(savefilters);

            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitch(_isGluten, 'Gluten-Free', 'Only include gluten-free meals',(val){
                  setState(() {
                    _isGluten=val;
                  });
                }),
                 _buildSwitch(_lactoseFree, 'Lactose-Free', 'Only include Lactose-free meals',(val){
                  setState(() {
                    _lactoseFree=val;
                  });
                }),
                 _buildSwitch(_isVegetarian, 'Vegetarian', 'Only include vegetarian meals',(val){
                  setState(() {
                    _isVegetarian=val;
                  });
                }),
                 _buildSwitch(_isVegan, 'Vegan', 'Only include vegan meals',(val){
                  setState(() {
                    _isVegan=val;
                  });
                }),
                
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSwitch(bool val,String title,String subTitle,Function updateVal) {
    return SwitchListTile(
      value:val,
      onChanged: updateVal,
      title: Text(title),
      subtitle: Text(subTitle),
    );
  }
}
