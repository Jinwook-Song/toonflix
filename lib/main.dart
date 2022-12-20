import 'package:flutter/material.dart';

enum CalcMethod { plus, minus }

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int counter = 0;

  void handleCounter(CalcMethod method) {
    switch (method) {
      case CalcMethod.plus:
        setState(() {
          counter++;
        });
        break;
      case CalcMethod.minus:
        // modify
        counter--;
        // notify to flutter
        setState(() {});
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: const Color.fromARGB(255, 206, 188, 188),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Counter',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          Text(
            '$counter',
            style: const TextStyle(
              fontSize: 30,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                iconSize: 40,
                onPressed: () => handleCounter(CalcMethod.minus),
                icon: const Icon(Icons.indeterminate_check_box),
              ),
              IconButton(
                iconSize: 40,
                onPressed: () => handleCounter(CalcMethod.plus),
                icon: const Icon(Icons.add_box_rounded),
              ),
            ],
          )
        ],
      )),
    ));
  }
}
