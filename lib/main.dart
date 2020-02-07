import 'package:flutter/material.dart';

import './screen/tabs_screen.dart';
import './screen/categories.dart';
import './screen/category_meals.dart';
import './screen/meal_detail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foodzy',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255,254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          body2: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          title: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),

        ),
        

      ),

      initialRoute: '/',
      routes: {
        '/':(ctx)=>TabsScreen(),
        CategoryMealsPage.routeName:(ctx)=>CategoryMealsPage(),
        MealDetailPage.routeName:(ctx)=>MealDetailPage(),
      },
      //onGenerateRoute called when you have not registered your route in your routes 
      //it is used when we use dynamic routes 
      //we donot requires it here
      onGenerateRoute: (settings){
        print(settings.arguments);
        //settings object is used to get arguments, name
        return MaterialPageRoute(builder: (ctx)=>CategoryMealsPage());
      },
      //onUnknownRoute called when Flutter fails to build page on our measures 
      onUnknownRoute: (settings){
        //this is used as when you enter url which is not exist then it display page as opps this page is not exist 
        return MaterialPageRoute(builder: (ctx)=>CategoryMealsPage());
      },
    );
  }
}



