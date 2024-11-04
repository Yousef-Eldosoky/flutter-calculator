import 'dart:math';

import 'package:calculator/Widgets/button_oval.dart';
import 'package:calculator/Widgets/button_rounded.dart';
import 'package:calculator/Widgets/switch_mode.dart';
import 'package:expressions/expressions.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  static const Color colorLight = Color(0xFFe6eeff);
  static const Color colorDark = Color(0xFF374352);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool darkMode = false;
  String input = ""; // Holds the input from buttons
  String result = "0"; // Displays the result after calculation

  void switching() {
    setState(() {
      darkMode = !darkMode;
    });
  }

  // Function to handle button taps and update the input
  void _onButtonPressed(String value) {
    setState(() {
      if (value == "C") {
        input = "";
        result = "0";
      } else if (value == "=") {
        if (input.isNotEmpty) {
          _calculateResult();
        }
      } else if (value == "%") {
        if (input.isNotEmpty) {
          value = "/100";
          input += value;
        }
      } else if (value == "/" ||
          value == "+" ||
          value == "-" ||
          value == "." ||
          value == "*") {
        if (input.isNotEmpty) {
          if (input[input.length - 1] == "/" ||
              input[input.length - 1] == "+" ||
              input[input.length - 1] == "-" ||
              input[input.length - 1] == "." ||
              input[input.length - 1] == "*") {
          } else {
            input += value;
          }
        }
      } else {
        input += value;
      }
    });
  }

  // Function to evaluate the input expression
  void _calculateResult() {
    try {
      double parsedResult = _evaluateExpression(input);
      result = parsedResult.toStringAsFixed(4);
    } catch (e) {
      result = "Error";
    }
  }

  double _evaluateExpression(String expression) {
    // Evaluate expression
    const evaluator = ExpressionEvaluator();
    Expression parsedExpression = Expression.parse(expression);
    double result = evaluator.eval(
        parsedExpression, {"cos": cos, "sin": sin, "tan": tan}).toDouble();
    return result;
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: darkMode ? MyHomePage.colorDark : MyHomePage.colorLight,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: switching,
                    child: SwitchMode(darkMode: darkMode),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      result,
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: darkMode ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "=",
                        style: TextStyle(
                          fontSize: 35,
                          color: darkMode ? Colors.green : Colors.grey,
                        ),
                      ),
                      Text(
                        input,
                        style: TextStyle(
                          fontSize: 20,
                          color: darkMode ? Colors.green : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonOval(
                        darkMode: darkMode,
                        title: "sin",
                        onPressed: () => _onButtonPressed("sin("),
                      ),
                      ButtonOval(
                        darkMode: darkMode,
                        title: "cos",
                        onPressed: () => _onButtonPressed("cos("),
                      ),
                      ButtonOval(
                        darkMode: darkMode,
                        title: "tan",
                        onPressed: () => _onButtonPressed("tan("),
                      ),
                      ButtonOval(
                        darkMode: darkMode,
                        title: "%",
                        onPressed: () => _onButtonPressed("%"),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buttonRounded(
                        darkMode: darkMode,
                        title: "C",
                        onPressed: () => _onButtonPressed("C"),
                      ),
                      _buttonRounded(
                        darkMode: darkMode,
                        title: "(",
                        onPressed: () => _onButtonPressed("("),
                      ),
                      _buttonRounded(
                        darkMode: darkMode,
                        title: ")",
                        onPressed: () => _onButtonPressed(")"),
                      ),
                      _buttonRounded(
                        darkMode: darkMode,
                        title: "/",
                        textColor: darkMode ? Colors.green : Colors.redAccent,
                        onPressed: () => _onButtonPressed("/"),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buttonRounded(
                        darkMode: darkMode,
                        title: "7",
                        onPressed: () => _onButtonPressed("7"),
                      ),
                      _buttonRounded(
                        darkMode: darkMode,
                        title: "8",
                        onPressed: () => _onButtonPressed("8"),
                      ),
                      _buttonRounded(
                        darkMode: darkMode,
                        title: "9",
                        onPressed: () => _onButtonPressed("9"),
                      ),
                      _buttonRounded(
                        darkMode: darkMode,
                        title: "x",
                        textColor: darkMode ? Colors.green : Colors.redAccent,
                        onPressed: () => _onButtonPressed("*"),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buttonRounded(
                        darkMode: darkMode,
                        title: "4",
                        onPressed: () => _onButtonPressed("4"),
                      ),
                      _buttonRounded(
                        darkMode: darkMode,
                        title: "5",
                        onPressed: () => _onButtonPressed("5"),
                      ),
                      _buttonRounded(
                        darkMode: darkMode,
                        title: "6",
                        onPressed: () => _onButtonPressed("6"),
                      ),
                      _buttonRounded(
                        darkMode: darkMode,
                        title: "-",
                        textColor: darkMode ? Colors.green : Colors.redAccent,
                        onPressed: () => _onButtonPressed("-"),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buttonRounded(
                        darkMode: darkMode,
                        title: "1",
                        onPressed: () => _onButtonPressed("1"),
                      ),
                      _buttonRounded(
                        darkMode: darkMode,
                        title: "2",
                        onPressed: () => _onButtonPressed("2"),
                      ),
                      _buttonRounded(
                        darkMode: darkMode,
                        title: "3",
                        onPressed: () => _onButtonPressed("3"),
                      ),
                      _buttonRounded(
                        darkMode: darkMode,
                        title: "+",
                        textColor: darkMode ? Colors.green : Colors.redAccent,
                        onPressed: () => _onButtonPressed("+"),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buttonRounded(
                        darkMode: darkMode,
                        title: "0",
                        onPressed: () => _onButtonPressed("0"),
                      ),
                      _buttonRounded(
                        darkMode: darkMode,
                        title: ".",
                        onPressed: () => _onButtonPressed("."),
                      ),
                      _buttonRounded(
                        darkMode: darkMode,
                        icon: Icons.backspace_outlined,
                        onPressed: () {
                          if (input.isNotEmpty) {
                            setState(() {
                              input = input.substring(0, input.length - 1);
                            });
                          }
                        },
                      ),
                      _buttonRounded(
                        darkMode: darkMode,
                        title: "=",
                        textColor: darkMode ? Colors.green : Colors.redAccent,
                        onPressed: () => _onButtonPressed("="),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

// ignore: camel_case_types
class _buttonRounded extends StatelessWidget {
  const _buttonRounded({
    required this.darkMode,
    this.title,
    this.icon,
    this.textColor,
    required this.onPressed,
  });

  final bool darkMode;
  final String? title;
  final IconData? icon;
  final Color? textColor;
  final VoidCallback onPressed; // Step 2: Add this property

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ButtonRounded(
          darkMode: darkMode,
          borderRadius: BorderRadius.circular(40),
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: 30,
            height: 30,
            child: Center(
              child: title != null
                  ? Text(
                      title!,
                      style: TextStyle(
                        color: textColor ??
                            (darkMode ? Colors.white : Colors.black),
                        fontSize: 25,
                      ),
                    )
                  : Icon(
                      icon,
                      color: darkMode ? Colors.green : Colors.redAccent,
                      size: 25,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
