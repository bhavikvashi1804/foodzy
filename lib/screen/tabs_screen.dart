import 'package:flutter/material.dart';



import '../screen/categories.dart';
import '../screen/fav_screen.dart';
import '../widget/main_drawer.dart';


class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {


  final List<Map<String,Object>> _pages=[
    {
      'page':CategoriesPage(),
      'title':'Categories',
    },
    {
      'page':FavPage(),
      'title':'Favorites',
    }
    
  ];


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