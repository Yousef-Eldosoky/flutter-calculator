import 'package:calculator/Widgets/button_rounded.dart';
import 'package:flutter/material.dart';

class ButtonOval extends StatelessWidget {
  const ButtonOval({
    super.key,
    required this.darkMode,
    required this.title,
    this.padding = 17, required this.onPressed,
  });

  final bool darkMode;
  final String title;
  final double padding;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ButtonRounded(
          darkMode: darkMode,
          padding: EdgeInsets.symmetric(
            horizontal: padding,
            vertical: padding / 2,
          ),
          borderRadius: BorderRadius.circular(50),
          child: SizedBox(
            width: padding * 2,
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                    color: darkMode ? Colors.white : Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
