import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
                "Settings Page",
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