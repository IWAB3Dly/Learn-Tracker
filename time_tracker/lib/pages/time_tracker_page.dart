import 'package:flutter/material.dart';
import 'package:time_tracker/components/time_tracker_widgets/activity_tile.dart';
import 'package:time_tracker/components/time_tracker_widgets/activity_adder.dart';
import 'package:time_tracker/components/time_tracker_widgets/stopwatch_container.dart';
import 'package:time_tracker/dart_classes/time_tracker/activities.dart';
import 'package:time_tracker/configurations/logger.dart';

class TimeTrackerPage extends StatefulWidget {
  const TimeTrackerPage({super.key});

  @override
  State<TimeTrackerPage> createState() => _TimeTrackerPageState();
}

class _TimeTrackerPageState extends State<TimeTrackerPage> {

  

  final controller = TextEditingController();

  void addActivity(){
    setState(() {
      if (controller.text.isNotEmpty) {
        activitiesList.add(Activity(activityName: controller.text, activitySeconds: 0));
        controller.clear();
        logger.d("added activity");
      }
    });
  }

  List<Activity> activitiesList = [
    Activity(activityName: "Programming", activitySeconds: 0),
    Activity(activityName: "Pooping", activitySeconds: 110),
    Activity(activityName: "Dating", activitySeconds: 1012),
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
                    child: const StopWatchWidget(),
                  )
                ),
                Expanded(
                  flex: 8,
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Theme.of(context).colorScheme.secondary),
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
                    return ActivityTile(
                      activityName: activitiesList[index].activityName,
                      secondsAmount: activitiesList[index].activitySeconds
                    );
                  }
                  
                  else{
                    return ActivityAdder(controller: controller, onSubmitted: addActivity);
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
