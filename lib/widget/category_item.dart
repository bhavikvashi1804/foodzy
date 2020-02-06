import 'package:flutter/material.dart';

import '../screen/category_meals.dart';

class CategoryItem extends StatelessWidget {
  
  final String title,ID;
  final Color color;


  CategoryItem(this.ID,this.title,this.color);

  void selectCategory(BuildContext ctx){
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder:(_){
          return CategoryMealsPage(
            ID,title,color
          );
        } 
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: ()=>selectCategory(context),
        borderRadius: BorderRadius.circular(15),
        splashColor: Theme.of(context).primaryColor,
        child: Container(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7),color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        
      ),
    );
  }
}