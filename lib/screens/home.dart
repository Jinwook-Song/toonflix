import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/api.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<WebtoonModel> webtoons = [];
  bool isReady = false;

  void callWebToonApi() async {
    webtoons = await ApiService.getTodaysToons();
    isReady = true;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    callWebToonApi();
  }

  @override
  Widget build(BuildContext context) {
    print(isReady);
    print(webtoons);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: const Text(
          "오늘의 웹툰",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
