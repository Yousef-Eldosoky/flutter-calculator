import 'package:calculator/Widgets/button_oval.dart';
import 'package:calculator/Widgets/button_rounded.dart';
import 'package:calculator/Widgets/switch_mode.dart';
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

  void switching() {
    setState(() {
      darkMode ? darkMode = false : darkMode = true;
    });
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
                      "6.010",
                      style: TextStyle(
                        fontSize: 55,
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
                        "10+50*12",
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
                      ),
                      ButtonOval(
                        darkMode: darkMode,
                        title: "cos",
                      ),
                      ButtonOval(
                        darkMode: darkMode,
                        title: "tan",
                      ),
                      ButtonOval(
                        darkMode: darkMode,
                        title: "%",
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buttonRounded(
                        darkMode: darkMode,
                        title: "C",
                      ),
                      _buttonRounded(
                        darkMode: darkMode,
                        title: "(",
                      ),
                      _buttonRounded(
                        darkMode: darkMode,
                        title: ")",
                      ),
                      _buttonRounded(
                        darkMode: darkMode,
                        title: "/",
                        textColor: darkMode ? Colors.green : Colors.redAccent,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buttonRounded(
                        darkMode: darkMode,
                        title: "7",
                      ),
                      _buttonRounded(
                        darkMode: darkMode,
                        title: "8",
                      ),
                      _buttonRounded(
                        darkMode: darkMode,
                        title: "9",
                      ),
                      _buttonRounded(
                        darkMode: darkMode,
                        title: "x",
                        textColor: darkMode ? Colors.green : Colors.redAccent,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buttonRounded(
                        darkMode: darkMode,
                        title: "4",
                      ),
                      _buttonRounded(
                        darkMode: darkMode,
                        title: "5",
                      ),
                      _buttonRounded(
                        darkMode: darkMode,
                        title: "6",
                      ),
                      _buttonRounded(
                        darkMode: darkMode,
                        title: "-",
                        textColor: darkMode ? Colors.green : Colors.redAccent,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buttonRounded(
                        darkMode: darkMode,
                        title: "1",
                      ),
                      _buttonRounded(
                        darkMode: darkMode,
                        title: "2",
                      ),
                      _buttonRounded(
                        darkMode: darkMode,
                        title: "3",
                      ),
                      _buttonRounded(
                        darkMode: darkMode,
                        title: "+",
                        textColor: darkMode ? Colors.green : Colors.redAccent,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buttonRounded(
                        darkMode: darkMode,
                        title: "0",
                      ),
                      _buttonRounded(
                        darkMode: darkMode,
                        title: ".",
                      ),
                      _buttonRounded(
                        darkMode: darkMode,
                        icon: Icons.backspace_outlined,
                      ),
                      _buttonRounded(
                        darkMode: darkMode,
                        title: "=",
                        textColor: darkMode ? Colors.green : Colors.redAccent,
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
  });

  final bool darkMode;
  final String? title;
  final IconData? icon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                      color:
                          textColor ?? (darkMode ? Colors.white : Colors.black),
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
    );
  }
}
