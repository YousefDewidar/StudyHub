import 'package:computers/core/utils/space.dart';
import 'package:computers/features/courses/data/models/course.dart';
import 'package:computers/features/courses/ui/widgets/lec_or_sec.dart';
import 'package:flutter/material.dart';

class LecSecRow extends StatelessWidget {
  const LecSecRow({
    super.key,
    required this.course,
  });

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LecOrSecOrExamWidget(
            num: course.numLec,
            title: "Lectures",
            onTap: () {},
          ),
          const SpaceH(5),
          LecOrSecOrExamWidget(
            num: course.numSec,
            title: "Sections",
            onTap: () {},
          ),
          const SpaceH(5),
          LecOrSecOrExamWidget(
            num: course.numLec,
            title: "Exams",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
