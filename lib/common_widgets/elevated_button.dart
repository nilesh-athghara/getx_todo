import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String label;
  final Function() onPressed;
  final Color color;
  CustomElevatedButton(
      {@required this.label, @required this.onPressed, @required this.color});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: Text(
          label,
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith((states) => color)),
        onPressed: onPressed);
  }
}
