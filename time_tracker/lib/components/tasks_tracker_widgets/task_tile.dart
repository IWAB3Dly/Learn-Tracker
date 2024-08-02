import 'package:flutter/material.dart';
import 'package:time_tracker/components/button_rounded.dart';
import 'package:time_tracker/components/tasks_tracker_widgets/task.dart';

class TaskTile extends StatefulWidget {
  final Task task;
  final VoidCallback onButtonPressed;
  const TaskTile({super.key, required this.task, required this.onButtonPressed});

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.only(right: 16, left: 8),
        decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.trackerBorder, width: 6))),
        child: Row(
          children: [
            Checkbox(value: widget.task.taskIsCompleted, onChanged: (value){
              setState(() {
                widget.task.taskIsCompleted = !widget.task.taskIsCompleted;
              });
            }),
            Text(
              widget.task.taskName,
              style: const TextStyle(fontSize: 22),
            ),
            const Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.only(bottom: 2, left: 8),
              child: RoundedButton(
                buttonSize: 24,
                onTap: widget.onButtonPressed,
                icon: Icons.download_done_rounded, 
                buttonColor: widget.task.taskIsCompleted? const MaterialStatePropertyAll(Colors.trackerCommitButton):const MaterialStatePropertyAll(Colors.trackerStopButton)
              ),
            ),
          ],
        ),
      ),
    );
  }
}