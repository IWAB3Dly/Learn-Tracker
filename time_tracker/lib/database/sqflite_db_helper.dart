import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'dart:io';

import 'package:time_tracker/dart_classes/time_tracker/activities.dart';

class DatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    _database ??= await initializeDatabase();
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    Directory directory = await getApplicationDocumentsDirectory();
    String path = '${directory.path}my_database.db';
    var database = await openDatabase(path, version: 2, onCreate: _createTable,);
    return database;
  }

  void _createTable(Database db, int newVersion) async {
    await db.execute('''
      CREATE TABLE activitiesList (
        id INTEGER PRIMARY KEY,
        activityName TEXT,
        secondsSpentOnActivity int,
        activitySessions int
      )
    ''');
    await db.insert('activitiesList', Activity(
      id: 0,
      activityName: "Overall Working Time",
      activitySeconds: 0,
      activitySessions: 0
    ).toMap());
  }

  Future<void> updateDatabase(Database database) async{

  }

  Future<List<Activity>> getActivityList() async {
    final db = await database;
    //updateDatabase(db);
    final List<Map<String, dynamic>> maps = await db.query('activitiesList');
    return List.generate(maps.length, (i) {
      return Activity.fromMap(maps[i]);
    });
  }

  Future<void> insertActivity(Activity activity) async {
    final db = await database;
    await db.insert('activitiesList', activity.toMap());
  }

  Future<void> deleteAllActivities(Database db) async {
    await db.execute('DELETE FROM activitiesList');
    await db.insert('activitiesList', Activity(
      id: 0,
      activityName: "Overall Working Time",
      activitySeconds: 0,
      activitySessions: 0
    ).toMap());
  }

  Future<void> updateActivity(Activity activity) async {
    final db = await database;
    await db.update('activitiesList', activity.toMap(), where: 'id =?', whereArgs: [activity.id]);
  }

}