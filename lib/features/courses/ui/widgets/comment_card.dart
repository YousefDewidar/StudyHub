import 'package:computers/core/utils/my_colors.dart';
import 'package:computers/core/utils/space.dart';
import 'package:flutter/material.dart';

class CommentCard extends StatelessWidget {
  const CommentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      // height: 100,
      width: double.infinity,
      decoration: BoxDecoration(color: MyColors.primary.withOpacity(.1)),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "@user name",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              Text(
                "20-5-2024",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
          SpaceV(8),
          Text(
            "دكتورة جميلة شكرا علي شرح حضرتك المميز",
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
