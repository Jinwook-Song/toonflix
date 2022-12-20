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
  List<int> numbers = [];

  void handleCounter(CalcMethod method) {
    switch (method) {
      case CalcMethod.plus:
        setState(() {
          numbers.add(numbers.length);
        });
        break;
      case CalcMethod.minus:
        setState(() {
          numbers.removeLast();
        });
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var number in numbers)
                Text(
                  '$number',
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                ),
            ],
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
