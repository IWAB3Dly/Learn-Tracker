class Activity {
  String activityName = "";
  int activitySeconds = 0;
  int activitySessions = 0;

  Activity({required this.activityName, required this.activitySeconds, required this.activitySessions});

  void activitySecondsIncrease(int increment){
    activitySeconds+=increment;
  }

  void activitySessionsIncrease(){
    activitySeconds++;
  }
}