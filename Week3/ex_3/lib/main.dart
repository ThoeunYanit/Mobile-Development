import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Container(
      padding:EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      child: Column(
        
        
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.blue[100]
            ),
            child: Center(
              child: Text('OOP', style:TextStyle(color: Colors.white)),
            )
          ),

          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.blue[300]
            ),
            child: Center(
              child: Text('DART', style:TextStyle(color: Colors.white)),
            )
          ),


          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(colors: [Colors.blue[300]!, Colors.blue[900]!])
            ),
            child: Center(
              child: Text('FLUTTER', style:TextStyle(color: Colors.white)),
            )
          )
        ],
      ),
     ),
  ));
}

