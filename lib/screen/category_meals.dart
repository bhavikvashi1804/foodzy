import 'package:flutter/material.dart';
import 'package:foodzy/models/meal.dart';


import '../models/dummy_categories.dart';
import '../widget/meal_item.dart';


class CategoryMealsPage extends StatefulWidget {


  static const String routeName='/category-meals';

  List<Meal> availableMeals;

  CategoryMealsPage(this.availableMeals);

  @override
  _CategoryMealsPageState createState() => _CategoryMealsPageState();
}

class _CategoryMealsPageState extends State<CategoryMealsPage> {


  String categoryTitle,categoryID;
  List<Meal> displayMeals;
  var _loadData=false;

  @override
  void initState() {


    super.initState();
  }


  @override
  void didChangeDependencies() {
    //initState works but problem is with ModalRoute context
    //to use context we have to use didChnageDependencies


    if(!_loadData){
      final routeArgs=ModalRoute.of(context).settings.arguments as Map<String,String>;

      categoryTitle=routeArgs['title'];
      categoryID=routeArgs['id'];
      

      displayMeals=widget.availableMeals.where((element) {
        return element.categories.contains(categoryID);
      }).toList();

      _loadData=true;
      //to load data only for first time
    }  
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    
    

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx,index){
          return MealItem(
            id:displayMeals[index].id,
            title: displayMeals[index].title,
            imageUrl: displayMeals[index].imageUrl, 
            duration: displayMeals[index].duration, 
            complexity: displayMeals[index].complexity, 
            afordability: displayMeals[index].affordability,
            removeItem: _removeMeal,
          );
        },
        itemCount: displayMeals.length,
      ),
    );
  }



  void _removeMeal(String mealID){

    setState(() {
      displayMeals.removeWhere((element) => element.id==mealID);
    });

  }
}