import 'package:computers/core/widgets/pdf%20view/find_page_dialog.dart';
import 'package:confetti/confetti.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:internet_file/internet_file.dart';
import 'package:pdfx/pdfx.dart';

class CustomPdfView extends StatefulWidget {
  const CustomPdfView({super.key});

  @override
  State<CustomPdfView> createState() => _CustomPdfViewState();
}

class _CustomPdfViewState extends State<CustomPdfView>
    with SingleTickerProviderStateMixin {
  late ConfettiController _confettiController;
  late Animation<double> _animation;
  late AnimationController _animationController;

  PdfController pdfController = PdfController(
      document: PdfDocument.openData(InternetFile.get(
          'https://drive.google.com/uc?export=download&id=1YqIwXcQAhM-3UudLvYokzzini2s4_GWn')));

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    _confettiController =
        ConfettiController(duration: const Duration(seconds: 3));
  }

  @override
  void dispose() {
    _animationController.dispose();
    pdfController.dispose();
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionBubble(
        items: <Bubble>[
          Bubble(
            title: "First",
            iconColor: Colors.white,
            bubbleColor: Colors.deepPurple,
            icon: Icons.keyboard_double_arrow_up,
            titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
            onPress: () {
              pdfController.animateToPage(0,
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.linear);
              setState(() {});
              _animationController.reverse();
            },
          ),
          Bubble(
            title: "Jump To",
            iconColor: Colors.white,
            bubbleColor: Colors.deepPurple,
            icon: Icons.find_in_page_sharp,
            titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
            onPress: () {
              showDialog(
                context: context,
                builder: (context) {
                  return  FindPageWidget(pdfController: pdfController);
                },
              );
              _animationController.reverse();
            },
          ),
          Bubble(
            title: "Download",
            iconColor: Colors.white,
            bubbleColor: Colors.deepPurple,
            icon: Icons.download,
            titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
            onPress: () {
              _animationController.reverse();
            },
          ),
        ],
        animation: _animation,
        onPress: () => _animationController.isCompleted
            ? _animationController.reverse()
            : _animationController.forward(),
        iconColor: Colors.deepPurple,
        iconData: Icons.menu_sharp,
        backGroundColor: Colors.white,
      ),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white)),
        backgroundColor: Colors.deepPurple,
        scrolledUnderElevation: 0,
        title: const Text(
          "Lec 3",
          style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Stack(children: [
        PdfView(
            controller: pdfController,
            scrollDirection: Axis.vertical,
            onPageChanged: (page) {
              page == pdfController.pagesCount
                  ? _confettiController.play()
                  : null;
              setState(() {});
            },
            backgroundDecoration:
                BoxDecoration(color: Colors.amber.withOpacity(.15))),
        pdfController.page == pdfController.pagesCount
            ? ConfettiWidget(
                confettiController: _confettiController,
                blastDirectionality: BlastDirectionality.explosive,
                shouldLoop: false,
                emissionFrequency: .07,
                colors: const [
                  Colors.red,
                  Colors.blue,
                  Colors.yellow,
                  Colors.red,
                  Colors.green,
                ],
                createParticlePath: (size) {
                  return Path()
                    ..addOval(Rect.fromCircle(
                        center: const Offset(40, 0), radius: 6));
                },
              )
            : const SizedBox(),
      ]),
    );
  }
}
