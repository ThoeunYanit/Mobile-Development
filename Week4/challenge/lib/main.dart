import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 100),

            Expanded(child: Container(height: 400, color: Colors.amber)),

            Row(
              children: [
                Expanded(
                  child: Container(height: 100, color: Colors.blue[100]),
                ),

                Container(height: 100, width: 100, color: Colors.blue[400]),
              ],
            ),

            Row(
              children: [
                Expanded(child: Container(height: 100, color: Colors.green)),

                const SizedBox(width: 20),

                Expanded(child: Container(height: 100, color: Colors.green)),

                const SizedBox(width: 20),

                Expanded(child: Container(height: 100, color: Colors.green)),
              ],
            ),

            SizedBox(height: 50),

            Expanded(child: Container(color: Colors.red)),
          ],
        ),
      ),
    ),
  );
}
