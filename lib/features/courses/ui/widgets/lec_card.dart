import 'package:computers/core/utils/my_colors.dart';
import 'package:computers/core/widgets/pdf%20view/custom_pdf_view.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class LectureCard extends StatelessWidget {
  const LectureCard({
    super.key,
    required this.index,
    required this.pdfLink,
    required this.vidLink,
    required this.typeCourse,
  });
  final int index;
  final String typeCourse;
  final String? pdfLink;
  final String? vidLink;

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
                    if (pdfLink != null) {
                      Navigator.push(
                        context,
                        PageTransition(
                          child: CustomPdfView(
                            title: "$typeCourse ${index + 1}",
                            pdfLink: pdfLink!,
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
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/pdf.png',
                          width: 50,
                          height: 40,
                        ),
                        const Spacer(),
                      ],
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
                      color: Colors.orange,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child: Column(
                      children: [
                        const Spacer(),
                        Image.asset(
                          'assets/images/youtube.png',
                          width: 50,
                          height: 50,
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
          padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(68, 0, 0, 0)),
          child: Text(
            textAlign: TextAlign.center,
            "$typeCourse ${index + 1}",
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
