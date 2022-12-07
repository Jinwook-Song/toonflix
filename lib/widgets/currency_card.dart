import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final String name, code, amount;
  final IconData icon;
  final int index;

  // private
  final _blackColor = const Color(0xFF1F2123);

  const CurrencyCard({
    super.key,
    required this.name,
    required this.code,
    required this.amount,
    required this.icon,
    required this.index,
  });

  bool isEven(int index) {
    return index % 2 == 0;
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, -index * 20),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            color: isEven(index) ? Colors.white : _blackColor,
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: isEven(index) ? _blackColor : Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text(amount,
                          style: TextStyle(
                            color: isEven(index) ? _blackColor : Colors.white,
                            fontSize: 20,
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        code,
                        style: TextStyle(
                          color: isEven(index)
                              ? _blackColor
                              : Colors.white.withOpacity(0.8),
                          fontSize: 20,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Transform.translate(
                offset: const Offset(-14, 40),
                child: Transform.scale(
                  scale: 2,
                  child: Icon(
                    icon,
                    color: isEven(index) ? _blackColor : Colors.white,
                    size: 96,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
