import 'package:flutter/material.dart';

import '../models/dummy_categories.dart';

class MealDetailPage extends StatelessWidget {

  static const String routeName='/meal-detail';

  @override
  Widget build(BuildContext context) {
    
    final String mealID=ModalRoute.of(context).settings.arguments as String;
    //get the first meal data 
    final selectedMeal=DUMMY_MEALS.firstWhere((element) => element.id==mealID);
    
    return Scaffold(
      appBar: AppBar(
        title:Text("${selectedMeal.title}"),
      ),
      body:SingleChildScrollView(
          child: Column(
          children: <Widget>[

            Container(
              height:300,
              width:double.infinity,
              child:Image.network(selectedMeal.imageUrl, fit:BoxFit.cover,),
            ),

            buildSectiionTitle(context,'Ingredients'),

            buildContainer(
              child: ListView.builder(
                itemBuilder:(ctx,index)=>Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                    child: Text(selectedMeal.ingredients[index]),
                  ),
                ) ,
                itemCount: selectedMeal.ingredients.length,
                
              ),
            ),



            buildSectiionTitle(context,'Steps'),
            buildContainer(
              child: ListView.builder(
                itemBuilder: (ctx,index)=>Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        child:Text('# ${index+1}'),
                      ),
                      title: Text(selectedMeal.steps[index]),
                    ),
                    Divider(),
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ) 
              
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: (){
          Navigator.of(context).pop(mealID);
        },  
      ),
      
      
    );
  }


  Widget buildSectiionTitle(BuildContext context,String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(title,style: Theme.of(context).textTheme.title),
    );
  }

  Widget buildContainer({Widget child}){
    return Container(
      height: 150,
      width: 300,

      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),

      decoration: BoxDecoration(
        color:Colors.white,
        border:Border.all(
          color:Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),


      child: child,


    );

  }


}


  