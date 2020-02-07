import 'package:flutter/material.dart';


import '../models/meal.dart';
import '../widget/meal_item.dart';

class FavPage extends StatelessWidget {

  final List<Meal> favMeals;

  FavPage(this.favMeals);


  @override
  Widget build(BuildContext context) {

    if(favMeals.isEmpty){
      return Center(
          child:Text('You have no favorites yet - staring adding some!'),
      );
    }
    else{
      return ListView.builder(
        itemBuilder: (ctx,index){
          return MealItem(
            id:favMeals[index].id,
            title: favMeals[index].title,
            imageUrl: favMeals[index].imageUrl, 
            duration: favMeals[index].duration, 
            complexity: favMeals[index].complexity, 
            afordability: favMeals[index].affordability,
            removeItem: null,
          );
        },
        itemCount: favMeals.length,
      );
    }    
  
  }
}