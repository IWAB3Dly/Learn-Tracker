import 'dart:async';

import 'package:flutter/material.dart';
import 'package:time_tracker/components/button_rounded.dart';
import 'package:time_tracker/configurations/logger.dart';

class StopWatchWidget extends StatefulWidget {
  final ValueNotifier<int> secondsNotifier;
  final VoidCallback finishSession;
  const StopWatchWidget({super.key, required this.secondsNotifier, required this.finishSession});

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
    _timer.cancel();
    logger.d('commited $seconds seconds');
    widget.secondsNotifier.value = seconds;
    widget.finishSession();
    setState(() {
      seconds = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: SizedBox(
            height: 80,
            child: Image.asset('assets/images/sandclock.png'),
          )
        ),
        Expanded(
          flex: 8,
          child: Text(
          "${(seconds~/3600).toString().padLeft(2,'0')}:${((seconds%3600)~/60).toString().padLeft(2,'0')}:${(seconds%60).toString().padLeft(2,'0')}",
          style: const TextStyle(fontSize: 60, fontWeight: FontWeight.w500),
            textAlign: TextAlign.start,
          )
        ),
        Expanded(
          flex: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RoundedButton(
                onTap: _startTimer,
                icon: Icons.play_arrow_rounded, 
                buttonColor: MaterialStateProperty.all(Colors.trackerStartButton),
                buttonSize: 36,
              ),
              RoundedButton(
                onTap: _stopTimer, 
                icon: Icons.pause_rounded, 
                buttonColor: MaterialStateProperty.all(Colors.trackerStopButton),
                buttonSize: 36,
              ),
              RoundedButton(
                onTap: _resetTimer, 
                icon: Icons.download_done_rounded, 
                buttonColor: MaterialStateProperty.all(Colors.trackerCommitButton),
                buttonSize: 36,
              ),
            ],
          )
        ),
      ],
    );
  }
}