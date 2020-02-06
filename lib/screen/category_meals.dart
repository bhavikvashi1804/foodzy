import 'package:flutter/material.dart';

class CategoryMealsPage extends StatelessWidget {


  final String categoryID,categoryTitle;
  final Color color;

  CategoryMealsPage(this.categoryID,this.categoryTitle,this.color);

  @override
  Widget build(BuildContext context) {
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