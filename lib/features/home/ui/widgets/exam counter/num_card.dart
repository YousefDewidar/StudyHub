
import 'package:flutter/material.dart';

class NumberCard extends StatelessWidget {
  final String num;
  const NumberCard({
    super.key,
    required this.num,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        width: 35,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color.fromARGB(55, 255, 255, 255),
        ),
        child: Center(
          child: Text(
            num,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ));
  }
}
