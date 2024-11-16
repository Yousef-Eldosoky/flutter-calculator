import 'package:calculator/Widgets/button_rounded.dart';
import 'package:flutter/material.dart';

class SwitchMode extends StatefulWidget {
  const SwitchMode({super.key, required this.darkMode});

  final bool darkMode;

  @override
  State<SwitchMode> createState() => _SwitchModeState();
}

class _SwitchModeState extends State<SwitchMode> {
  @override
  Widget build(BuildContext context) {
    return ButtonRounded(
      darkMode: widget.darkMode,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      borderRadius: BorderRadius.circular(40),
      child: SizedBox(
        width: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.wb_sunny,
              color: widget.darkMode ? Colors.grey : Colors.redAccent,
            ),
            Icon(
              Icons.nightlight_round,
              color: widget.darkMode ? Colors.green : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
