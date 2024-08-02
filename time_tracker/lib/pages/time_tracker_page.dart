import 'package:flutter/material.dart';
import 'package:time_tracker/components/time_tracker_widgets/activity_tile.dart';
import 'package:time_tracker/components/time_tracker_widgets/activity_adder.dart';
import 'package:time_tracker/components/time_tracker_widgets/activity_tracker.dart';
import 'package:time_tracker/components/time_tracker_widgets/stopwatch_container.dart';
import 'package:time_tracker/dart_classes/time_tracker/activities.dart';
import 'package:time_tracker/configurations/logger.dart';
import 'package:time_tracker/database/sqflite_db_helper.dart';

class TimeTrackerPage extends StatefulWidget {
  final DatabaseHelper dbHelper;

  const TimeTrackerPage({super.key, required this.dbHelper});

  @override
  State<TimeTrackerPage> createState() => _TimeTrackerPageState();
}

class _TimeTrackerPageState extends State<TimeTrackerPage> {

  late DatabaseHelper dbHelper; 

  String currentActivityName = "Programming";
  int currentActivitySessionsAmount = 0;
  int currentActivityIndex = 0;
  final controller = TextEditingController();
  ValueNotifier<int> secondsNotifier = ValueNotifier(0);
  String activityAdderHintText = "Add a new skill you want to master";
  Color activityAdderHintColor = Colors.grey.shade400;
  late Future<int?> _activityListLength;

  void addActivity(){
    bool isRepeatedName = false;
    setState(() {
      for (var i = 0; i < activitiesList.length; i++) {
        if(controller.text == activitiesList[i].activityName){
          isRepeatedName = true;
        }
      }
      if (!isRepeatedName) {
        if (controller.text.isNotEmpty){
          insertActivityToDB();
          activitiesList.add(
            Activity(
              id: activitiesList.length, 
              activityName: controller.text, 
              activitySeconds: 0, 
              activitySessions: 1
            )
          );
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
      _activityListLength = Future.value(activitiesList.length);
    });
  }

  void insertActivityToDB()async{
    await 
    dbHelper.insertActivity(
      Activity(
        id: activitiesList.length,
        activityName: controller.text, 
        activitySeconds:0, 
        activitySessions: 1
      )
    );
  }

  void finishSession(int secondsWorked){
    if (secondsWorked > 0) {
      setState(() {
        if (currentActivityIndex==0) {
          activitiesList[currentActivityIndex].activitySeconds += secondsWorked;
          dbHelper.updateActivity(
            Activity(
              id: 0,
              activityName: currentActivityName,
              activitySeconds: activitiesList[currentActivityIndex].activitySeconds,
              activitySessions: activitiesList[currentActivityIndex].activitySessions
            )
          );
        } 
        else {
          activitiesList[currentActivityIndex].activitySeconds += secondsWorked;
          activitiesList[currentActivityIndex].activitySessions++;
          activitiesList[0].activitySeconds += secondsWorked;
          dbHelper.updateActivity(
            Activity(
              id: currentActivityIndex,
              activityName: currentActivityName,
              activitySeconds: activitiesList[currentActivityIndex].activitySeconds,
              activitySessions: activitiesList[currentActivityIndex].activitySessions
            )
          );
          logger.d(activitiesList[currentActivityIndex].activitySessions);
          dbHelper.updateActivity(
            Activity(
              id: 0,
              activityName: activitiesList[0].activityName,
              activitySeconds: activitiesList[0].activitySeconds,
              activitySessions: activitiesList[0].activitySessions+1
            )
          );
        }
        currentActivityIndex = 0;
        currentActivitySessionsAmount = 0;
        logger.d("Current Activity Index is $currentActivityIndex");
      });
    }
  }

  void trackForActivity(int activityIndex){
    setState(() {
      currentActivityName = activitiesList[activityIndex].activityName;
      currentActivitySessionsAmount = activitiesList[activityIndex].activitySessions;
      currentActivityIndex = activityIndex;
      logger.d(activitiesList[activityIndex].activitySessions);
    });
  }

  List<Activity> activitiesList = [];

  Future<void> updateActivityList() async{
    activitiesList = await dbHelper.getActivityList();
  }

  Future<int> getActivityListLength() async{
    await updateActivityList();
    int activityListLength = activitiesList.length;
    return activityListLength;
  }

  @override
  void initState(){
    super.initState();
    dbHelper = widget.dbHelper;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _activityListLength = Future.value(getActivityListLength());
  }

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
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.trackerContainerBackground),
                    child: StopWatchWidget(secondsNotifier: secondsNotifier, finishSession: () => finishSession(secondsNotifier.value),),
                  )
                ),
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.trackerContainerBackground,
                        image: const DecorationImage(
                          image: AssetImage("assets/images/activityTrackerBackground.png"),
                          fit: BoxFit.cover
                        )
                      ),
                      child: CurrentAcitiviyDisplayer(
                        activityName: currentActivityName,
                        activitySessions: currentActivitySessionsAmount,
                      ),
                    ),
                  )
                ),
              ],
            ),
          ),
          Expanded(
            flex: 9,
            child: Container(
              margin: const EdgeInsets.all(8),
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.trackerContainerBackground),
              child: FutureBuilder(
                future: _activityListLength,
                  builder:(context, snapshot) { 
                    if (snapshot.hasData){
                      return ListView.builder(
                      itemCount: snapshot.data!+1,
                      itemBuilder: (context, index){
                        if (index < snapshot.data!) {
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
                    );
                  }
                  else {
                    logger.d("loading");
                    return const Center(child: Text('boogogaaga'));
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
