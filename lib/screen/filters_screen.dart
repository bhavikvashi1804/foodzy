import 'package:flutter/material.dart';
import '../widget/main_drawer.dart';


class FilterScreen extends StatelessWidget {

  static const String routeName='/filters';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Filters'),),
      drawer: MainDrawer(),
      body:Center(child:Text('Filter screen')),
    );
  }
}