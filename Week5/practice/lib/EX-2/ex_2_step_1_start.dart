import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Favorite cards"),
      ),
      body: Column(
        children: [
          // Container(
          //   // YOUR CODE
          // ),

          // //Part2 - Stateless Widget
          // FavoriteCard(isFavorite: true),
          // FavoriteCard(isFavorite: false),
          // FavoriteCard(isFavorite: true),

          // // Part3- Stateful Widget
          FavoriteCard(),
          FavoriteCard(),
          FavoriteCard(),

        ],
      ),
    ),
  ),
);

// class FavoriteCard extends StatelessWidget {
//   const FavoriteCard({super.key, required this.isFavorite});

//   final bool isFavorite;

//   IconData get getFilledIcon =>
//       isFavorite ? Icons.favorite : Icons.favorite_border;

//   Color? get getColorOfIcon => isFavorite ? Colors.red : null;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
//       decoration: BoxDecoration(
//         border: Border(bottom: BorderSide(width: 1, color: Colors.grey)),
//       ),
//       child: Row(
//         children: [
//           Expanded(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('title', style: TextStyle(color: Colors.blue)),
//                 SizedBox(height: 10),
//                 Text('description'),
//               ],
//             ),
//           ),

//           IconButton(onPressed: () => {}, icon: Icon(getFilledIcon, color: getColorOfIcon, )),
//         ],
//       ),
//     );
//   }
// }

class FavoriteCard extends StatefulWidget {
  const FavoriteCard({super.key});

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  bool isFavorite = false;

  IconData get getFilledIcon => isFavorite ? Icons.favorite : Icons.favorite_border;

  Color? get getColorOfIcon => isFavorite ? Colors.red : null;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 1, color: Colors.grey)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('title', style: TextStyle(color: Colors.blue)),
                SizedBox(height: 10),
                Text('description'),
              ],
            ),
          ),

          IconButton(
            onPressed: () => {
              setState(() {
                isFavorite = !isFavorite;
              }),
            },
            icon: Icon(getFilledIcon, color: getColorOfIcon),
          ),
        ],
      ),
    );
  }
}
