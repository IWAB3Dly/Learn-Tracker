import 'package:flutter/material.dart';

class DrawerListTile extends StatefulWidget {

  final IconData icon;
  final String text;
  final bool isDrawerHowered;
  final VoidCallback onTap;

  DrawerListTile({super.key, required this.icon, required this.text, this.isDrawerHowered = false, required this.onTap});

  @override
  State<DrawerListTile> createState() => _DrawerListTileState();
}

class _DrawerListTileState extends State<DrawerListTile> {
  Color currentColor = const Color.fromARGB(255, 51, 51, 51);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      color: currentColor,
      child: MouseRegion(
        onEnter: (event) => setState(()=>currentColor = Theme.of(context).hoverColor),
        onExit: (event) => setState(()=>currentColor = Theme.of(context).primaryColor),
        child: InkWell(
          onTap: widget.onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              children: [
                Icon(widget.icon, color: Theme.of(context).scaffoldBackgroundColor, size: 32,),
                const SizedBox(width: 5),
                buildListTile(widget.icon, widget.text, widget.isDrawerHowered),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildListTile(IconData icon, String text, bool isDrawerHowered) {
      return AnimatedCrossFade(
        firstChild: Container(),
        secondChild: Text(text, style: const TextStyle(fontSize: 14, color: Colors.white),),
        crossFadeState: isDrawerHowered? CrossFadeState.showSecond : CrossFadeState.showFirst,
        duration: const Duration(milliseconds: 120),
      );
    }
}