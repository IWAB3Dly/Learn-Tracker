import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonTitle;
  final MaterialStateProperty<Color> buttonColor;

  const RoundedButton({super.key, required this.onTap, required this.buttonTitle, required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        backgroundColor: buttonColor
      ),
      child: Text(
        buttonTitle, 
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w500
        ),
      ),
    );
  }
}