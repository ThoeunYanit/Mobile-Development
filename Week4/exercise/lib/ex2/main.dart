import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Custom buttons'),
          backgroundColor: Colors.grey[100],
        ),
        body: Container(
          padding: EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomButton(label: 'Submit', icon: Icons.check),

              CustomButton(
                label: 'Time',
                icon: Icons.access_time,
                buttonType: ButtonType.secondary,
                position: IconPosition.right,
              ),

              CustomButton(
                label: 'Account',
                icon: Icons.account_box,
                buttonType: ButtonType.disabled,
                position: IconPosition.right,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

enum ButtonType {
  primary(Colors.blue),
  secondary(Colors.green),
  disabled(Colors.grey);

  const ButtonType(this.colorType);

  final Color colorType;
}

enum IconPosition { left, right }

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.buttonType = ButtonType.primary,
    this.position = IconPosition.left,
    required this.label,
    required this.icon,
  });

  final ButtonType buttonType;
  final String label;
  final IconData icon;
  final IconPosition position;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: buttonType.colorType,
      ),
      margin: EdgeInsets.only(bottom: 20),
      height: 40,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: rowWidgets,
      ),
    );
  }

  List<Widget> get rowWidgets {

    // text
    Text text = Text(label, style: TextStyle(color: Colors.grey[300]));

    //icon
    Padding iconPosition = Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Icon(icon, color: Colors.grey[300]),
    );

    //
 
    return position == IconPosition.left ? [text, iconPosition] : [iconPosition,text];
  }

  // Widget leftPosition() {
  //   return Row(
  //     children: [
  //       Padding(
  //         padding: EdgeInsets.only(left: 10, right: 10),
  //         child: Icon(icon, color: Colors.grey[300]),
  //       ),
  //       Text(label, style: TextStyle(color: Colors.grey[300])),
  //     ],
  //   );
  // }

  // Widget rightPosition() {
  //   return Row(
  //     children: [
  //       Text(label, style: TextStyle(color: Colors.grey[300])),
  //       Padding(
  //         padding: EdgeInsets.only(left: 10, right: 10),
  //         child: Icon(icon, color: Colors.grey[300]),
  //       ),
  //     ],
  //   );
  // }
}
