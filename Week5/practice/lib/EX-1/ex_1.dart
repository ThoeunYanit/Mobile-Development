import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text("Custom buttons")),
      body: Center(
        child: Column(children: [
          SelectableButton(),
          SizedBox(height: 10,),
          SelectableButton(),
          SizedBox(height: 10,),
          SelectableButton(),
          SizedBox(height: 10,),
          SelectableButton(),
        ],)
      ),
    ),
  ),
);

class SelectableButton extends StatefulWidget {
  const SelectableButton({super.key});

  @override
  State<SelectableButton> createState() => _SelectableButtonState();
}

class _SelectableButtonState extends State<SelectableButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
        onPressed: () => {
          setState(() {
            status =! status ;
          }),
        },
        style: ElevatedButton.styleFrom(backgroundColor: getBackgroundColor),
        child: Center(child: Text(getText, style: TextStyle(color: getTextColor),)),
      ),
    );
  }

  bool status = false;

  Color get getBackgroundColor {
    if (status) {
      return Colors.blue[500]!;
    } else {
      return Colors.blue[50]!;
    }
  }

  String get getText {
    if (status) {
      return 'Selected';
    } else {
      return 'Not Selected';
    }
  }

  Color get getTextColor {
    if (status) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }
}
