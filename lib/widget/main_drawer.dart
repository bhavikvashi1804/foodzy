import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            color: Theme.of(context).accentColor,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 20,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
         
          buildListTile('Meals', Icons.restaurant),
          buildListTile('Filter',Icons.settings),
          
        ],
      ),
    );
  }

  Widget buildListTile(String title, IconData iconData) {
    return ListTile(
      leading: Icon(iconData,size: 26,),
      title: Text(
        title,
        style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoCondensed'),
      ),
      onTap: () {},
    );
  }
}
