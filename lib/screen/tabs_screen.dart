import 'package:flutter/material.dart';



import '../screen/categories.dart';
import '../screen/fav_screen.dart';
import '../widget/main_drawer.dart';
import '../models/meal.dart';


class TabsScreen extends StatefulWidget {
  
  final List<Meal> favMeals;

  TabsScreen(this.favMeals);
  
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  List<Meal> fMeals;
  List<Map<String,Object>> _pages;


  //widget is not available to use in _pages
  @override
  void initState() { 


    _pages=[
      {
        'page':CategoriesPage(),
        'title':'Categories',
      },
      {
        'page':FavPage(widget.favMeals),
        //here in init state widget.favMeals is allowed 
        'title':'Favorites',
      }
      
    ];
    
    super.initState();
  }


  int _selectedPageIndex=0;

  void selectPage(int index){
    setState(() {
      _selectedPageIndex=index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectedPageIndex]['title']),
        ) ,
        drawer: MainDrawer(),
        body: _pages[_selectedPageIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          onTap: selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedPageIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title:Text('Categories'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              title:Text('Favorites'),
            ),
          ],
        ),
    );
  }
}