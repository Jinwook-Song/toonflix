import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  final title, thumb, id;

  const Detail({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Hero(
                tag: id,
                child: Container(
                  // width: 250,
                  decoration: const BoxDecoration(
                      // borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          offset: Offset(3, 5),
                          color: Colors.black45,
                        )
                      ]),
                  clipBehavior: Clip.hardEdge,
                  child: Image.network(thumb),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
