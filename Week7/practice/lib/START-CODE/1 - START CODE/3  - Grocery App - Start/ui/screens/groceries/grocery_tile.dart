// ---------------------------------------------
// Create a new stateless widget : GroceryTile
// ---------------------------------------------

// The widget shall take as required parameter a Grocery

// 	Use a ListTile widget to layout the elements

// https://api.flutter.dev/flutter/material/ListTile-class.html

import 'package:flutter/material.dart';
import 'package:practice/START-CODE/1%20-%20START%20CODE/3%20%20-%20Grocery%20App%20-%20Start/models/grocery.dart';

class GroceryItemTile extends StatelessWidget {
  const GroceryItemTile({super.key, required this.grocery});

  final GroceryItem grocery;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 15,
        width: 15,
        color: grocery.category.color,
      ),
      title: Text(grocery.name),
      trailing: Text(grocery.quantity.toString()),
    );
  }
}
