import 'package:computers/core/utils/space.dart';
import 'package:computers/features/courses/data/models/course.dart';
import 'package:computers/features/courses/ui/widgets/lec_grid_view.dart';
import 'package:computers/features/courses/ui/widgets/lec_sec_row.dart';
import 'package:flutter/material.dart';

class CourseDetailsView extends StatelessWidget {
  final Course course;
  const CourseDetailsView({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: course.boxColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
        ),
        scrolledUnderElevation: 0,
        title: Text(
          course.sub,
          style:
              const TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SpaceV(10),
              LecSecRow(course: course),
              const SpaceV(20),
              LecturesGridView(course: course),
            ],
          ),
        ),
      ),
    );
  }
}
