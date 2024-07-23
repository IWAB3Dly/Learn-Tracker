import 'package:flutter/material.dart';

class ActivityTile extends StatelessWidget {
  final int secondsAmount;
  final String activityName;
  final VoidCallback onTap;
  const ActivityTile({super.key, required this.activityName, required this.secondsAmount, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MouseRegion(
        onEnter:(event) => (),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade500, width: 2))),
            child: Row(
              children: [
                Text(
                  activityName,
                  style: const TextStyle(fontSize: 22),
                ),
                const Expanded(child: SizedBox()),
                Text(
                  "${(secondsAmount~/3600).toString().padLeft(2,'0')}:${((secondsAmount%3600)~/60).toString().padLeft(2,'0')}:${(secondsAmount%60).toString().padLeft(2,'0')}",
                  style: const TextStyle(fontSize: 22),
                ),
              ],
            ),
          ),
        ),

      ),
    );
  }
}