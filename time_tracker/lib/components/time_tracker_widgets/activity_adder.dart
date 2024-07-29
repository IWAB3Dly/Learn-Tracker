// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActivityAdder extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback onSubmitted;
  String hintText;
  Color hintColor;
  ActivityAdder({super.key, required this.controller, required this.onSubmitted, required this.hintText, required this.hintColor});

  @override
  State<ActivityAdder> createState() => _ActivityAdderState();
}

class _ActivityAdderState extends State<ActivityAdder> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Color.fromARGB(255, 192, 194, 215), width: 6))),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                focusNode: _focusNode,
                onChanged: (value) {
                  setState(() {
                    widget.hintText = "Add a new skill you want to master";
                    widget.hintColor = Colors.grey.shade400;
                  });
                },
                controller: widget.controller,
                onSubmitted:(value) => widget.onSubmitted(),
                style: GoogleFonts.jua(
                  fontSize: 22,
                  color: const Color.fromARGB(255, 52, 55, 88)
                ),
                decoration: InputDecoration(
                  hintText: _focusNode.hasFocus? null : widget.hintText,
                  hintStyle: TextStyle(color: widget.hintColor),
                  border: InputBorder.none
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}