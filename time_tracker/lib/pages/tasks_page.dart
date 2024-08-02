import 'package:flutter/material.dart';
import 'package:time_tracker/components/tasks_tracker_widgets/task.dart';
import 'package:time_tracker/components/tasks_tracker_widgets/task_adder.dart';
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

  final controller = TextEditingController();

  List<Task> tasksList = [
    Task(id: 0, taskName: "task 1 hop", taskIsCompleted: false),
    Task(id: 1, taskName: "task 2 hey", taskIsCompleted: false),
    Task(id: 2, taskName: "task 3 la", taskIsCompleted: true),
    Task(id: 3, taskName: "task 4 la", taskIsCompleted: false),
    Task(id: 4, taskName: "task 5 lay", taskIsCompleted: false),
  ];

  void commitTaskAsCompleted(int taskIndex){
    if (tasksList[taskIndex].taskIsCompleted) {
      setState(() {
        tasksList.removeAt(taskIndex);
        todayTasksCompleted++;
        overallTasksCompleted++;
      });
    }
  }

  void addNewTask(){
    if (controller.text.isNotEmpty) {
      setState(() {
        tasksList.add(
          Task(
            id: tasksList.length,
            taskName: controller.text,
            taskIsCompleted: false
          )
        );
        controller.clear();
      });
    }
  }

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
                  itemCount: tasksList.length+1,
                  itemBuilder: (context, index){
                    if (index<tasksList.length) {
                      return TaskTile(
                        task: tasksList[index], 
                        onButtonPressed: () => commitTaskAsCompleted(index),
                      );
                    } 
                    else {
                      return TaskAdder(controller: controller, onSubmitted: addNewTask);
                    }
                }),
              )
            )
          ],
        ),
      ),
    );
  }
}