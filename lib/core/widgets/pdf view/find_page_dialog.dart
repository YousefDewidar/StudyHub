import 'package:computers/core/utils/space.dart';
import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

class FindPageWidget extends StatelessWidget {
  final PdfController pdfController;
  const FindPageWidget({
    super.key,
    required this.pdfController,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Dialog(
      backgroundColor: Colors.deepPurple,
      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "JUMP TO PAGE",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            const SpaceV(10),
            TextField(
              style: const TextStyle(color: Colors.white),
              autofocus: true,
              keyboardType: TextInputType.number,
              cursorColor: Colors.white,
              controller: controller,
              decoration: const InputDecoration(
                hintText: "Enter page number",
                hintStyle: TextStyle(color: Colors.white),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
              ),
            ),
            Text(
              "*Pdf pages count are ${pdfController.pagesCount}",
              style: const TextStyle(fontSize: 16, color: Colors.orange),
            ),
            const SpaceV(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: ElevatedButton(
                onPressed: () {
                  if (int.parse(controller.text) <= pdfController.pagesCount!) {
                    pdfController.animateToPage(int.parse(controller.text),
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.linear);
                    Navigator.pop(context);
                  } else {}
                },
                child: const Text(
                  "GO",
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
            const SpaceV(10),
          ],
        ),
      ),
    );
  }
}
