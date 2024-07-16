import 'package:flutter/material.dart';
import 'package:time_tracker/components/drawer_list_tile.dart';
import 'package:time_tracker/pages/learning_plan_page.dart';
import 'package:time_tracker/pages/statistics_page.dart';
import 'package:time_tracker/pages/time_tracker_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> pagesList = [TimeTrackerPage(),StatisticsPage(),LearningPlanPage()];

  bool isDrawerHowered = false;
  int currentPageIndex = 0;

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
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Column(
                  children: [
                    DrawerListTile(icon: Icons.timer_sharp, text: "Time Tracker", isDrawerHowered: isDrawerHowered, onTap: () => switchBetweenPages(0),),
                    DrawerListTile(icon: Icons.show_chart_sharp, text: "Statistics", isDrawerHowered: isDrawerHowered, onTap: () => switchBetweenPages(1)),
                    DrawerListTile(icon: Icons.menu_book_sharp, text: "Learning Plan", isDrawerHowered: isDrawerHowered, onTap: () => switchBetweenPages(2)),
                    Expanded(child: Container()),
                    DrawerListTile(icon: Icons.settings_sharp, text: "Settings", isDrawerHowered: isDrawerHowered, onTap: () => switchBetweenPages(3)),
                  ],
                ),
              ),
          ),
          Expanded(child: pagesList[currentPageIndex])
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