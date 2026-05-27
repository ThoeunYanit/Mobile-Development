import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Welcome !', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
        centerTitle: true,
        
        
      ),

      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.yellowAccent[700]
              
            ),
            padding: EdgeInsets.all(30),
            margin: EdgeInsets.all(10),
            width: double.infinity,
            
            child: Text('My Hobbies', style: TextStyle(color: Colors.white)),
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.pinkAccent
              
                ),
                padding: EdgeInsets.symmetric(vertical: 100, horizontal: 50),
                margin: EdgeInsets.fromLTRB(10, 10, 40, 10),
                
                child: Text('Soccer', style: TextStyle(color: Colors.white)),
              ),
            
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.redAccent
              
                ),
                padding: EdgeInsets.symmetric(vertical: 100, horizontal: 50),
                margin: EdgeInsets.fromLTRB(40, 10, 10, 10),
                child: Text('Flutter', style: TextStyle(color: Colors.white)),
              ),
            ]
          )
          
        ],

      ),

      bottomNavigationBar: Container(
        color: Colors.red,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            Container(width: 100,  margin:EdgeInsets.all(8), decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.yellow,
              
            ),),

            Container(width: 100,  margin: EdgeInsets.all(8), decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),),

            Container(width: 100,  margin: EdgeInsets.all(8), decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.yellow,
            ),)
          ],
        )
        
      ),
    )
  ));
}
