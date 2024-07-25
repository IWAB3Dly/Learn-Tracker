import 'dart:async';

import 'package:flutter/material.dart';
import 'package:time_tracker/components/button_rounded.dart';
import 'package:time_tracker/configurations/logger.dart';
import 'package:time_tracker/generated/l10n.dart';

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
              RoundedButton(onTap: _startTimer, buttonTitle: S.of(context).start, buttonColor: MaterialStateProperty.all(Colors.green.shade600)),
              RoundedButton(onTap: _stopTimer, buttonTitle: S.of(context).stop, buttonColor: MaterialStateProperty.all(Colors.orange.shade600)),
              RoundedButton(onTap: _resetTimer, buttonTitle: S.of(context).commit, buttonColor: MaterialStateProperty.all(Colors.lightBlue.shade600)),
            ],
          )
        ),
      ],
    );
  }
}