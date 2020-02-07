import 'package:flutter/material.dart';

import './screen/filters_screen.dart';
import './screen/tabs_screen.dart';
import './screen/category_meals.dart';
import './screen/meal_detail.dart';
import './models/meal.dart';
import './models/dummy_categories.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String,bool> _filters={
    'gluten':false,
    'veg':false,
    'lactose':false,
    'vegan':false,
  };

  List<Meal> availableMeals=DUMMY_MEALS;
  List<Meal> favMeals=[];


  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      print('before ${availableMeals.length}');
      availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['veg'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });

    print('after  ${availableMeals.length}');
  }



 

  void _toggleFavorite(String mealId) {
    
    final existingIndex =favMeals.indexWhere((meal) => meal.id == mealId);
    // returns -1 if not found

    
    if (existingIndex >= 0) {
      setState(() {
        favMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool _isMealFav(String id){
    return favMeals.any(
      (meal)=>meal.id==id
    );
  }



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
        '/':(ctx)=>TabsScreen(favMeals),
        CategoryMealsPage.routeName:(ctx)=>CategoryMealsPage(availableMeals),
        MealDetailPage.routeName:(ctx)=>MealDetailPage(_toggleFavorite,_isMealFav),
        FilterScreen.routeName:(ctx)=>FilterScreen(_filters,_setFilters),
      },
      //onGenerateRoute called when you have not registered your route in your routes 
      //it is used when we use dynamic routes 
      //we donot requires it here
      onGenerateRoute: (settings){
        print(settings.arguments);
        //settings object is used to get arguments, name
        return MaterialPageRoute(builder: (ctx)=>CategoryMealsPage(availableMeals));
      },
      //onUnknownRoute called when Flutter fails to build page on our measures 
      onUnknownRoute: (settings){
        //this is used as when you enter url which is not exist then it display page as opps this page is not exist 
        return MaterialPageRoute(builder: (ctx)=>CategoryMealsPage(availableMeals));
      },
    );
  }
}



