import 'dart:async';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int totalSec = 1500; // 25 minutes
  bool isRunning = false;
  late Timer timer;

  void handleTick(Timer timer) {
    setState(() {
      totalSec--;
    });
  }

  void handleStart() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      handleTick,
    );
    setState(() {
      isRunning = true;
    });
  }

  void handlePause() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(children: [
        Flexible(
          flex: 1,
          child: Container(
            alignment: Alignment.bottomCenter,
            child: Text(
              totalSec.toString(),
              style: TextStyle(
                color: Theme.of(context).cardColor,
                fontSize: 89,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Flexible(
          flex: 3,
          child: Center(
            child: IconButton(
              onPressed: isRunning ? handlePause : handleStart,
              iconSize: 98,
              color: Theme.of(context).cardColor,
              icon: Icon(
                isRunning
                    ? Icons.pause_circle_outline
                    : Icons.play_circle_outline,
              ),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(50)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'pomodoros',
                        style: TextStyle(
                          color: Theme.of(context).textTheme.headline1!.color,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '0',
                        style: TextStyle(
                          color: Theme.of(context).textTheme.headline1!.color,
                          fontSize: 58,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
