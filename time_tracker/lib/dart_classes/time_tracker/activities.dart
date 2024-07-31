class Activity {
  int id;
  String activityName = "";
  int activitySeconds = 0;
  int activitySessions = 0;

  Activity({required this.id,required this.activityName, required this.activitySeconds, required this.activitySessions});

  factory Activity.fromMap(Map<String, dynamic> map) {
    return Activity(
      id: map['id'],
      activityName: map['activityName'],
      activitySeconds: map['secondsSpentOnActivity'],
      activitySessions: map['activitySessions']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'activityName': activityName,
      'secondsSpentOnActivity': activitySeconds,
      'activitySessions': activitySessions
    };
  }

}