import 'package:computers/core/utils/my_colors.dart';
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
    return Stack(
      alignment: Alignment.center,
      children: [
        Card(
          elevation: 10,
          child: Column(
            children: [
              // pdf
              Expanded(
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    if (course.lectures?[index]['pdf'] != null) {
                      Navigator.push(
                        context,
                        PageTransition(
                          child: CustomPdfView(
                            title: "Lec ${index + 1}",
                            pdfLink: course.lectures![index]['pdf'],
                          ),
                          type: PageTransitionType.fade,
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('PDF not available!'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.only(top: 10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: MyColors.deepBlue,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                    child: const Text(
                      textAlign: TextAlign.center,
                      "Pdf",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              // video
              Expanded(
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 10),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child: const Column(
                      children: [
                        Spacer(),
                        Text(
                          textAlign: TextAlign.center,
                          "Video",
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // اسم المحاضرة اللي ف نص الويدجت
        Container(
          width: 85,
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(68, 0, 0, 0)),
          child: Text(
            textAlign: TextAlign.center,
            "Lec ${index + 1}",
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
