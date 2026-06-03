import 'package:flutter/material.dart';

//// PART-1: Build the UI

// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: Scaffold(
//       body: Center(
//         child: Container(
//           color: Colors.grey,
//           padding: EdgeInsets.all(100),

//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,

//             // each button - one button each
//             children: [
//               Container(decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 color: Colors.green,
//               ),
//               height: 100 ,
//               child: Center(
//                 child: Row(
//                   children: [
//                     Container(padding: EdgeInsets.only(left: 30, right: 20), child: Icon(Icons.travel_explore, color: Colors.white), ),
//                     Text('Travelling', style: TextStyle(fontSize: 26, color: Colors.white),)],),),)
//             ],
//           )
//         )
//       ),
//     )
//   ));
// }



//// PART-2: Create a HobbyCard widget
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(title: Text('My Hobbies'),),
      body: Center(
        child: Container(
          color: Colors.grey,
          padding: EdgeInsets.all(40),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,

            // each button - one button each
            children: [
              HobbyCard(title: 'Travelling', icon: Icons.travel_explore, color: Colors.green,),
              SizedBox(height: 10,),
              HobbyCard(title: 'Skating', icon: Icons.skateboarding),
              SizedBox(height: 10,),
              HobbyCard(title: 'Eating', icon: Icons.cookie_rounded, color: Colors.brown,),
              SizedBox(height: 10,),
              HobbyCard(title: 'Watching Movies', icon: Icons.local_movies, color: Colors.orange,),
              SizedBox(height: 10,),

            ],
          )
        )
      ),
    )
  ));
}


class HobbyCard extends StatelessWidget {
  const HobbyCard({
    super.key,
    required this.title,
    required this.icon,
    this.color = Colors.blue,
  });

  final String title;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
      height: 100,
      

      child: Center(
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 30, right: 20),
              child: Icon(icon, color: Colors.white),
            ),
            Text(
              title,
              style: TextStyle(fontSize: 26, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}



