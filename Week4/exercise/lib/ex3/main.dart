import 'package:flutter/material.dart';

//// PART 1 - Build the UI

// void main() {
//   runApp(
//     MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text('Products')),
//         body: Container(
//           color: Colors.lightBlueAccent,
//           padding: EdgeInsets.all(20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,

//             children: [
//               Card(
//                 color: Colors.white,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.all(20),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Image.asset('assets/images/ex3/dart.png', width: 100),
//                       Text('Dart', style: TextStyle(fontSize: 30)),
//                       Text(
//                         'the best object language',
//                         style: TextStyle(color: Colors.grey),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
// }

// PART-2 : enum
enum Product {
  dart('Dart', 'the best object language', 'assets/images/ex3/dart.png'),
  flutter(
    'Flutter',
    'the best mobile widget library',
    'assets/images/ex3/flutter.png',
  ),
  firebase(
    'Firebase',
    'the best cloud database',
    'assets/images/ex3/firebase.png',
  );

  const Product(this.title, this.description, this.image);

  final String title;
  final String description;
  final String image;
}


//// PART-3: Create a Product widget
class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(product.image, height: 80, width: 100,),
            Text(product.title, style: TextStyle(fontSize: 30)),
            Text(
              product.description,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}


void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Products')),
        body: Container(
          color: Colors.lightBlueAccent,
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [
              ProductCard(product: Product.dart),
              ProductCard(product: Product.flutter),
              ProductCard(product: Product.firebase),
            ],
          ),
        ),
      ),
    ),
  );
}
