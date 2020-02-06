import 'package:flutter/material.dart';


import '../models/dummy_categories.dart';

class CategoryMealsPage extends StatelessWidget {


  static const String routeName='/category-meals';

  /*
  final String categoryID,categoryTitle;
  final Color color;

  CategoryMealsPage(this.categoryID,this.categoryTitle,this.color);
  */


  @override
  Widget build(BuildContext context) {
    
    final routeArgs=ModalRoute.of(context).settings.arguments as Map<String,String>;

    final categoryTitle=routeArgs['title'];
    final categoryID=routeArgs['id'];
    final categoryMeals=DUMMY_MEALS.where((element) {
      return element.categories.contains(categoryID);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx,index){
          return Text(categoryMeals[index].title);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}