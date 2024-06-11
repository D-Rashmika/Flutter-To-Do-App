import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  MyButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
  return MaterialButton(
    onPressed: onPressed,
    color: Color.fromARGB(255, 11, 9, 10), // Change this line to set the button color
    textColor: Colors.white, // Optional: Change this line to set the text color
    child: Text(text),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.5)
    ),
  );
  }
}