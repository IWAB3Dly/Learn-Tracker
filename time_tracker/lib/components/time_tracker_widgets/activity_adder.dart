import 'package:flutter/material.dart';

class ActivityAdder extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSubmitted;
  const ActivityAdder({super.key, required this.controller, required this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade500, width: 2))),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              onSubmitted:(value) => onSubmitted(),
              style: const TextStyle(
                fontSize: 22
              ),
              decoration: const InputDecoration(
                hintText: "Add new Activity to master"
              ),
            ),
          ),
        ],
      )
    );
  }
}