import 'package:flutter/material.dart';


class FilterScreen extends StatelessWidget {

  static const String routeName='/filters';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Filter'),),
      body:Center(child:Text('Filter screen')),
    );
  }
}