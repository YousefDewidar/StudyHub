import 'dart:ui';

class Course {
  final String sub;
  final String disc;
  final String img;
  final String numLec;
  final String numSec;
  final Color boxColor;

  Course({
    required this.numLec,
    required this.numSec,
    required this.sub,
    required this.disc,
    required this.boxColor,
    required this.img,
  });
}
