import 'package:flutter/material.dart';

class CategoryMealsPage extends StatelessWidget {

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
    
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child:Text("The recipes for the category"),
      ),
    );
  }
}