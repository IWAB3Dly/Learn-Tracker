// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskAdder extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback onSubmitted;
  const TaskAdder({super.key, required this.controller, required this.onSubmitted});

  @override
  State<TaskAdder> createState() => _TaskAdderState();
}

class _TaskAdderState extends State<TaskAdder> {
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
                controller: widget.controller,
                onSubmitted:(value) => widget.onSubmitted(),
                style: GoogleFonts.jua(
                  fontSize: 22,
                  color: Colors.trackerText
                ),
                decoration: InputDecoration(
                  hintText: _focusNode.hasFocus? null : "Add a new task to complete",
                  hintStyle: const TextStyle(color: Colors.trackerStopButton),
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