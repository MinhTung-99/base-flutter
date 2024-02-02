import 'package:flutter/material.dart';

class ButtonTextWidget extends StatelessWidget {
  const ButtonTextWidget(
      {super.key, required this.title, required this.onPressed});

  final String title;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        //minimumSize: Size(100, 36),
        //maximumSize: Size(300, 30),
        padding: EdgeInsets.zero,
        backgroundColor: Colors.blue
      ),
      child: Text(title),
    );
  }
}
