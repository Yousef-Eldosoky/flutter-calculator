import 'package:flutter/material.dart';

class ButtonRounded extends StatefulWidget {
  const ButtonRounded({super.key, required this.colorState});

  final Color colorState;

  @override
  State<ButtonRounded> createState() => _ButtonRoundedState();
}

class _ButtonRoundedState extends State<ButtonRounded> {
  bool _isPressed = false;

  void _onPointerDown(PointerDownEvent event) {
    setState(() {
      _isPressed = true;
    });
  }

  void _onPointerUp(PointerUpEvent event) {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: _onPointerDown,
      onPointerUp: _onPointerUp,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: widget.colorState,
          borderRadius: BorderRadius.circular(10),
          boxShadow: _isPressed
              ? null
              : [
                  BoxShadow(
                    color: Colors.blueGrey.shade200,
                    offset: const Offset(4.0, 4.0),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                  const BoxShadow(
                    color: Colors.white,
                    offset: Offset(-4, -4),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                ],
        ),
        child: const Icon(
          Icons.apple,
          size: 100,
        ),
      ),
    );
  }
}
