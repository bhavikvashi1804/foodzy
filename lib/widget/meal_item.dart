import 'package:flutter/material.dart';
import 'package:foodzy/models/meal.dart';


class MealItem extends StatelessWidget {


  final String title,imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability afordability;


  MealItem({
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.afordability
  });

  void selectMeal(){

  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectMeal,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        elevation: 4.0,
        margin: const EdgeInsets.all(10),

        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                 ClipRRect(
                  borderRadius: BorderRadius.only(topLeft:Radius.circular(15),topRight: Radius.circular(15)),
                  child: Image.network(imageUrl,height : 250,width: double.infinity,fit:BoxFit.cover ,),
                ),
              ],

            ),
          ],
        ),
      ),
    );
  }
}