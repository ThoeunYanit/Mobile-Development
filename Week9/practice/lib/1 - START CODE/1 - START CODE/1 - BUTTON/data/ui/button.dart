import 'package:flutter/material.dart';

class StatusButton extends StatelessWidget {
  final String name;
  final bool selected;
  final VoidCallback onPressed;

  const StatusButton({
    super.key,
    required this.name,
    required this.selected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
       style: ElevatedButton.styleFrom(backgroundColor: selected? Colors.blue : Colors.grey),
      child: Text(name, style: TextStyle(color: Colors.black)),
    );
  }
}
