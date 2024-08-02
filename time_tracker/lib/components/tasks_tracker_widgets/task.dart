class Task {
  int id;
  String taskName = "";
  bool taskIsCompleted = false;

  Task({required this.id,required this.taskName, required this.taskIsCompleted});

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      taskName: map['taskName'],
      taskIsCompleted: map['taskIsCompleted']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'taskName': taskName,
      'taskIsCompleted': taskIsCompleted,
    };
  }

}