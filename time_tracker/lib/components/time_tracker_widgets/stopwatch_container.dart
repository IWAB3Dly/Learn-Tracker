import 'dart:async';

import 'package:flutter/material.dart';
import 'package:time_tracker/components/button_rounded.dart';
import 'package:time_tracker/configurations/logger.dart';

class StopWatchWidget extends StatefulWidget {
  const StopWatchWidget({super.key});

  @override
  State<StopWatchWidget> createState() => _StopWatchWidgetState();
}

class _StopWatchWidgetState extends State<StopWatchWidget> {
  Timer _timer = Timer(Duration.zero, () { });
  int seconds = 0;

  void _startTimer() {
    if (!_timer.isActive) {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          seconds++;
        });
      });
    }
  }

  void _stopTimer() {
    _timer.cancel();
  }

  void _resetTimer() {
    logger.d('commited $seconds seconds');
    setState(() {
      seconds = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 7,
          child: Text(
          "${(seconds~/3600).toString().padLeft(2,'0')}:${((seconds%3600)~/60).toString().padLeft(2,'0')}:${(seconds%60).toString().padLeft(2,'0')}",
          style: const TextStyle(fontSize: 60, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
          )
        ),
        Expanded(
          flex: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
                RoundedButton(onTap: _startTimer, buttonTitle: "Start", buttonColor: MaterialStateProperty.all(Colors.green.shade600)),
                RoundedButton(onTap: _stopTimer, buttonTitle: "Stop", buttonColor: MaterialStateProperty.all(Colors.orange.shade600)),
                RoundedButton(onTap: _resetTimer, buttonTitle: "Commit", buttonColor: MaterialStateProperty.all(Colors.lightBlue.shade600)),
            ],
          )
        ),
      ],
    );
  }
}