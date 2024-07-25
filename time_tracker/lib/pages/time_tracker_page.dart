import 'package:flutter/material.dart';
import 'package:time_tracker/components/time_tracker_widgets/activity_tile.dart';
import 'package:time_tracker/components/time_tracker_widgets/activity_adder.dart';
import 'package:time_tracker/components/time_tracker_widgets/activity_tracker.dart';
import 'package:time_tracker/components/time_tracker_widgets/stopwatch_container.dart';
import 'package:time_tracker/dart_classes/time_tracker/activities.dart';
import 'package:time_tracker/configurations/logger.dart';

class TimeTrackerPage extends StatefulWidget {
  const TimeTrackerPage({super.key});

  @override
  State<TimeTrackerPage> createState() => _TimeTrackerPageState();
}

class _TimeTrackerPageState extends State<TimeTrackerPage> {

  String currentActivityName = "Programming";
  int currentActivitySessionsAmount = 0;
  int currentActivityIndex = 0;
  final controller = TextEditingController();
  ValueNotifier<int> secondsNotifier = ValueNotifier(0);
  String activityAdderHintText = "Add a new skill you want to master";
  Color activityAdderHintColor = Colors.grey.shade400;

  void addActivity(){
    bool isRepeatedName = false;
    setState(() {
      for (var i = 0; i < activitiesList.length; i++) {
        if(controller.text == activitiesList[i].activityName){
          isRepeatedName = true;
        }
      }
      if (!isRepeatedName) {
        if (controller.text.isNotEmpty) {
          activitiesList.add(Activity(activityName: controller.text, activitySeconds: 0, activitySessions: 1));
          controller.clear();
          logger.d("added activity");
          activityAdderHintText = "Add a new skill you want to master";
          activityAdderHintColor = Colors.grey.shade400;
        }
      } 
      else {
        setState(() {
          controller.clear();
          activityAdderHintColor = Colors.red.shade300;
          activityAdderHintText = "This name already exists";
        });
        logger.e('This name already exists');
      }
    });
  }

  void finishSession(int secondsWorked){
     setState(() {
      if (currentActivityIndex==0) {
        activitiesList[currentActivityIndex].activitySeconds += secondsWorked;
      } 
      else {
        activitiesList[currentActivityIndex].activitySeconds += secondsWorked;
        activitiesList[currentActivityIndex].activitySessions++;
        activitiesList[0].activitySeconds += secondsWorked;
      }
      currentActivityIndex = 0;
    });
  }

  void trackForActivity(int activityIndex){
    setState(() {
      currentActivityName = activitiesList[activityIndex].activityName;
      currentActivitySessionsAmount = activitiesList[activityIndex].activitySessions;
      currentActivityIndex = activityIndex;
    });
  }

  List<Activity> activitiesList = [
    Activity(activityName: "Total Time Worked", activitySeconds: 0, activitySessions: 1),
    Activity(activityName: "Pooping", activitySeconds: 110, activitySessions: 1),
    Activity(activityName: "Dating", activitySeconds: 1012, activitySessions: 1),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Theme.of(context).colorScheme.secondary),
                    child: StopWatchWidget(secondsNotifier: secondsNotifier, finishSession: () => finishSession(secondsNotifier.value),),
                  )
                ),
                Expanded(
                  flex: 8,
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Theme.of(context).colorScheme.secondary),
                    child: CurrentAcitiviyDisplayer(
                      activityName: currentActivityName,
                      activitySessions: currentActivitySessionsAmount,
                    ),
                  )
                ),
              ],
            ),
          ),
          Expanded(
            flex: 15,
            child: Container(
              margin: const EdgeInsets.all(8),
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Theme.of(context).colorScheme.secondary),
              child: ListView.builder(
                itemCount: activitiesList.length+1,
                itemBuilder: (context, index){
                  if (index<activitiesList.length) {
                    if (index==0) {
                      return ActivityTile(
                        activityName: activitiesList[index].activityName,
                        secondsAmount: activitiesList[index].activitySeconds,
                        onTap: ()=> trackForActivity(index),
                        isClickable: false,
                      );
                    } 
                    else {
                      return ActivityTile(
                        activityName: activitiesList[index].activityName,
                        secondsAmount: activitiesList[index].activitySeconds,
                        onTap: ()=> trackForActivity(index),
                      );
                    }
                  }
                  else{
                    return ActivityAdder(controller: controller, onSubmitted: addActivity, hintColor: activityAdderHintColor, hintText: activityAdderHintText,);
                  }
                }
              ),
            )
          ),
        ],
      )
    );
  }
}
