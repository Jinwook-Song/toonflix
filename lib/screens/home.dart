import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/api.dart';

class Home extends StatelessWidget {
  Home({super.key});

  Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
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
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Text('Succeeded with data');
          } else if (snapshot.hasError) {
            return const Text('Something went wrong');
          } else {
            return const Text('Loading...');
          }
        },
      ),
    );
  }
}
