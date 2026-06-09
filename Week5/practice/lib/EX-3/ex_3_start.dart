import 'package:flutter/material.dart';

List<String> images = [
  "assets/w4-s2/bird.jpg",
  "assets/w4-s2/bird2.jpg",
  "assets/w4-s2/insect.jpg",
  "assets/w4-s2/girl.jpg",
  "assets/w4-s2/man.jpg",
];

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false, // Why this line ? Can you explain it ?
    home: Carrousel(),
  ),
);



class Carrousel extends StatefulWidget {
  const Carrousel({super.key});

  @override
  State<Carrousel> createState() => _CarrouselState();
}

class _CarrouselState extends State<Carrousel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Go to the previous image',
            onPressed: () => {previousImage},
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next image',
              onPressed: () => {nextImage},
            ),
          ),
        ],
      ),
      body: Image.asset(images[index]),
    );
  }

  int index = 0;

  int imagesLength = images.length;

  int get previousImage {
    setState(() {
      index -= 1;
      if (index < 0) {
        index = imagesLength - 1; // 5 - 1
      }
    });
    return index;
  }

  int get nextImage {
    setState(() {
      index += 1;
      // 5 - 1
      if (index > imagesLength - 1) {
        index = 0;
      }
    });
    return index;
  }
}
