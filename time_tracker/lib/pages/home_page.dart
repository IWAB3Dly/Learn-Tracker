import 'package:flutter/material.dart';
import 'package:time_tracker/components/drawer_list_tile.dart';
import 'package:time_tracker/database/sqflite_db_helper.dart';
import 'package:time_tracker/pages/learning_plan_page.dart';
import 'package:time_tracker/pages/settings_page.dart';
import 'package:time_tracker/pages/statistics_page.dart';
import 'package:time_tracker/pages/tasks_page.dart';
import 'package:time_tracker/pages/time_tracker_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DatabaseHelper databaseHelper = DatabaseHelper();

  List<Widget>? pageList;

  bool isDrawerHowered = false;
  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    pageList = [TimeTrackerPage(dbHelper: databaseHelper,), const TasksPage(), const StatisticsPage(),const LearningPlanPage(), const SettingsPage()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          MouseRegion(
            onEnter: (event) => setState(() => isDrawerHowered = true),
            onExit: (event) => setState(() => isDrawerHowered = false),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 120),
              width: isDrawerHowered? 150 : 51,
              decoration: const BoxDecoration(
                color: Colors.trackerCommitButton,
              ),
              child: Column(
                  children: [
                    DrawerListTile(icon: Icons.timer_rounded, text: "Time Tracker", isDrawerHowered: isDrawerHowered, onTap: () => switchBetweenPages(0),),
                    DrawerListTile(icon: Icons.check_circle_rounded, text: "Tasks Tracker", isDrawerHowered: isDrawerHowered, onTap: () => switchBetweenPages(1),),
                    DrawerListTile(icon: Icons.show_chart_rounded, text: "Statistics", isDrawerHowered: isDrawerHowered, onTap: () => switchBetweenPages(2)),
                    DrawerListTile(icon: Icons.menu_book_rounded, text: "Learning Plan", isDrawerHowered: isDrawerHowered, onTap: () => switchBetweenPages(3)),
                    Expanded(child: Container()),
                    DrawerListTile(icon: Icons.settings_rounded, text: "Settings", isDrawerHowered: isDrawerHowered, onTap: () => switchBetweenPages(4)),
                  ],
                ),
              ),
          ),
          Expanded(child: pageList![currentPageIndex])
        ],
      )
    );

  }

  void switchBetweenPages(int pageIndex){
    setState(() {
      currentPageIndex = pageIndex;
    });
  }
    
}