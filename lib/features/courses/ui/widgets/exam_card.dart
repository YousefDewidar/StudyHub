import 'package:computers/core/utils/my_colors.dart';
import 'package:computers/core/utils/space.dart';
import 'package:computers/core/widgets/pdf%20view/custom_pdf_view.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class ExamCard extends StatelessWidget {
  const ExamCard({
    super.key,
    required this.index,
    required this.pdfLink,
  });
  final int index;
  final String? pdfLink;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          if (pdfLink != null) {
            Navigator.push(
              context,
              PageTransition(
                child: CustomPdfView(
                  title: "Exam ${index + 1}",
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
          width: double.infinity,
          decoration: BoxDecoration(
              color: MyColors.deepBlue,
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/pdf.png',
                width: 60,
                height: 50,
              ),
              const SpaceV(10),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(41, 235, 235, 235)),
                child: Text(
                  textAlign: TextAlign.center,
                  "Exam ${index + 1}",
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
