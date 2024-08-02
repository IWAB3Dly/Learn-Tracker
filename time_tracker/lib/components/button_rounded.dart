import 'package:flutter/material.dart';



class RoundedButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final int buttonSize;
  final MaterialStateProperty<Color> buttonColor;

  const RoundedButton({super.key, required this.onTap, required this.icon, required this.buttonColor, required this.buttonSize});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonSize*2.8,
      child: IconButton(
        icon: Icon(icon, size: buttonSize.toDouble(), color: Colors.white,),
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor: buttonColor
        ),
      ),
    );
  }
}