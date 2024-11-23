import 'package:computers/core/widgets/pdf%20view/custom_pdf_view.dart';
import 'package:computers/features/courses/data/models/course.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class LectureCard extends StatelessWidget {
  const LectureCard({
    super.key,
    required this.course,
    required this.index,
  });

  final Course course;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
            child: CustomPdfView(
              title: course.sub,
              pdfLink: course.lectures![index]['pdf'],
            ),
            type: PageTransitionType.fade,
          ),
        );
      },
      child: Card(
        elevation: 1,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: course.boxColor.withOpacity(.3),
              ),
              color: Colors.white.withOpacity(.3),
              borderRadius: BorderRadius.circular(12)),
          child: Center(
              child: Text(
            "Lec ${index + 1}",
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          )),
        ),
      ),
    );
  }
}
