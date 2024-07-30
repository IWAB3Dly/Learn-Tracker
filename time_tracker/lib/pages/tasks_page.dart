import 'package:flutter/material.dart';
import 'package:time_tracker/components/tasks_tracker_widgets/task_tile.dart';
import 'package:time_tracker/components/tasks_tracker_widgets/tasks_completed_text.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {

  int todayTasksCompleted = 0;
  int overallTasksCompleted = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.trackerBackground,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: CompletedTasksText(
                      overallTasksCompleted: overallTasksCompleted,
                      todayTasksCompleted: todayTasksCompleted,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.trackerContainerBackground,
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: Image.asset("assets/images/sandclock.png"),
                    )
                  )
                ],
              )
            ),
            Expanded(
              flex: 6,
              child: Container(
                margin: const EdgeInsets.only(top: 12),
                decoration: BoxDecoration(
                  color: Colors.trackerContainerBackground,
                  borderRadius: BorderRadius.circular(8)
                ),
                child: ListView.builder(
                  itemCount: 15,
                  itemBuilder: (context, index){
                    return TaskTile(taskName: "Aboba#$index");
                }),
              )
            )
          ],
        ),
      ),
    );
  }
}