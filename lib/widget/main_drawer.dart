import 'package:flutter/material.dart';

import '../screen/filters_screen.dart';

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
         
          buildListTile('Meals', Icons.restaurant,(){ Navigator.of(context).pushReplacementNamed('/');}),
          buildListTile('Filter',Icons.settings,(){ Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);}),
          //pushReplacementNamed route does not amke load on Stack
          //replace current page with new page
          //donot generate stack of pages
          //for login this is also used 
          
        ],
      ),
    );
  }

  Widget buildListTile(String title, IconData iconData,Function tapHandler) {
    return ListTile(
      leading: Icon(iconData,size: 26,),
      title: Text(
        title,
        style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoCondensed'),
      ),
      onTap: tapHandler,
    );
  }
}
