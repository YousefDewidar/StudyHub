
import 'package:computers/features/courses/data/models/course.dart';
import 'package:flutter/material.dart';

class LectureCard extends StatelessWidget {
  const LectureCard({
    super.key,
    required this.course,
  });

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: course.boxColor.withOpacity(.3),
            ),
            color: Colors.white.withOpacity(.3),
            borderRadius: BorderRadius.circular(12)),
        child: const Center(
            child: Text(
          "Lec 0",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        )),
      ),
    );
  }
}
