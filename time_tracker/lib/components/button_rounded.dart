import 'package:flutter/material.dart';



class RoundedButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final MaterialStateProperty<Color> buttonColor;

  const RoundedButton({super.key, required this.onTap, required this.icon, required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: IconButton(
        icon: Icon(icon, size: 36, color: Colors.white,),
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor: buttonColor
        ),
      ),
    );
  }
}