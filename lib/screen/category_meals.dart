import 'package:flutter/material.dart';


import '../models/dummy_categories.dart';
import '../widget/meal_item.dart';


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
          return MealItem(id:categoryMeals[index].id,title: categoryMeals[index].title, imageUrl: categoryMeals[index].imageUrl, duration: categoryMeals[index].duration, complexity: categoryMeals[index].complexity, afordability: categoryMeals[index].affordability);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}