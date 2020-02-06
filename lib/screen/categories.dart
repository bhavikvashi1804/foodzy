import 'package:flutter/material.dart';


import '../models/dummy_categories.dart';
import '../widget/category_item.dart';

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(10.0),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3/2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      
      children: DUMMY_CATEGORIES.map((catData) => 
      
        CategoryItem(catData.title, catData.color),

      ).toList(),
      
    );
  }
}