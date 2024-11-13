
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only( top: 3),
        height: 60,
        width: double.infinity,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello,',
              style: TextStyle(fontSize: 18, height: .9),
            ),
            Text(
              'Yousef Dewidar 👋',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ));
  }
}
