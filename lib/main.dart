import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            textTheme: TextTheme(
                titleLarge: TextStyle(
          fontSize: 40,
          color: Colors.amber.shade200,
        ))),
        home: Scaffold(
          backgroundColor: const Color.fromARGB(255, 14, 13, 13),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              MyLargeTitle(),
            ],
          )),
        ));
  }
}

class MyLargeTitle extends StatelessWidget {
  const MyLargeTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Large Title',
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}
