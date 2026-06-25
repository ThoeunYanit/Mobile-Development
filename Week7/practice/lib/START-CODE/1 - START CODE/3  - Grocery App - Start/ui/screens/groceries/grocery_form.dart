// ---------------------------------------------
// Create a new statefull widget : GroceryForm
// ---------------------------------------------

// The form shall be composed of 2 text fields:
// -	Name of the grocery item
//-	Quantity (number only)

// ⚠️  For now we don’t select the grocery type, we assume it’s always food

// The form shall be composed of 2 buttons:
//-	Cancel button
// -	Add item button

import 'package:flutter/material.dart';

class GroceryForm extends StatefulWidget {
  const GroceryForm({super.key});

  @override
  State<GroceryForm> createState() => _GroceryFormState();
}

class _GroceryFormState extends State<GroceryForm> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text('Add a new item'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: 
          Column(
            
            children: [
              TextField(decoration: InputDecoration(labelText: 'Name'),),
              SizedBox(height: 20,),
              TextField(decoration: InputDecoration(labelText: 'Quantity'),),
              SizedBox(height: 20,),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                TextButton(onPressed: () {}, child: Text('Reset'),),
                ElevatedButton(onPressed: () {}, child: Text('Add Item'),),
              ],),
              
            ],),

        
      ),
    );
  }
}
