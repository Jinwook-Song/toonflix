import 'dart:async';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const initalCount = 1500; // 25 minutes
  int totalSec = initalCount;
  bool isRunning = false;
  int totalPomodoros = 0;
  late Timer timer;

  void handleTick(Timer timer) {
    if (totalSec == 0) {
      setState(() {
        isRunning = false;
        totalPomodoros++;
        totalSec = initalCount;
      });
      timer.cancel();
    } else {
      setState(() {
        totalSec--;
      });
    }
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

  String timeFormmat(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split('.').first.substring(2);
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
              timeFormmat(totalSec),
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
                        totalPomodoros.toString(),
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
