import 'package:flutter/material.dart';

class ButtonTextWidget extends StatelessWidget {
  const ButtonTextWidget(
      {super.key, required this.title, this.onPressed});

  final String title;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(title),
    );
  }
}
