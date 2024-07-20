class Activity {
  String activityName = "";
  int activitySeconds = 0;

  Activity({required this.activityName, required this.activitySeconds});

  void activitySecondsIncrease(int increment){
     activitySeconds+=increment;
  }
}