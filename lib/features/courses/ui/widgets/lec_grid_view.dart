import 'package:computers/features/courses/data/models/course.dart';
import 'package:computers/features/courses/ui/widgets/lec_card.dart';
import 'package:flutter/material.dart';

class LecturesGridView extends StatelessWidget {
  const LecturesGridView({
    super.key,
    required this.course,
  });

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: course.lectures?.length ?? 0,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        itemBuilder: (context, index) {
          return LectureCard(course: course, index: index);
        },
      ),
    );
  }
}
