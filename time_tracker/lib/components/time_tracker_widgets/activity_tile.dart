import 'package:flutter/material.dart';

class ActivityTile extends StatelessWidget {
  final int secondsAmount;
  final String activityName;
  final VoidCallback onTap;
  final bool isClickable;
  const ActivityTile({super.key, required this.activityName, required this.secondsAmount, required this.onTap, this.isClickable = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MouseRegion(
        onEnter:(event) => (),
        cursor: isClickable? SystemMouseCursors.click: SystemMouseCursors.cell,//SystemMouseCursors.click,
        child: AbsorbPointer(
          absorbing: !isClickable,
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.only(right: 16, left: 8),
              decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.trackerBorder, width: 6))),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 5, right: 25, bottom: 5),
                    height: MediaQuery.of(context).size.height/15,
                    child: Image.asset('assets/images/activityTileStar.png'), 
                  ),
                  Text(
                    activityName,
                    style: const TextStyle(fontSize: 22),
                  ),
                  const Expanded(child: SizedBox()),
                  Text(
                    "${(secondsAmount~/3600).toString().padLeft(2,'0')}:${((secondsAmount%3600)~/60).toString().padLeft(2,'0')}:${(secondsAmount%60).toString().padLeft(2,'0')}",
                    style: const TextStyle(fontSize: 22),
                  ),
                ],
              ),
            ),
          ),
        ),

      ),
    );
  }
}