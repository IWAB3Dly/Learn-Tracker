// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade500, width: 2))),
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
              style: const TextStyle(
                fontSize: 22
              ),
              decoration: InputDecoration(
                hintText: _focusNode.hasFocus? null : widget.hintText,
                hintStyle: TextStyle(color: widget.hintColor)
              ),
            ),
          ),
        ],
      )
    );
  }
}