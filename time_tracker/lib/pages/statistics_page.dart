import 'package:flutter/material.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({super.key});

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 84),
        child: const Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Text(
                "Statistics Page",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
              ),
              Text("Right now this section is on work You'll be able to use it soon")
            ],
          ),
        ),
      )
    );
  }
}