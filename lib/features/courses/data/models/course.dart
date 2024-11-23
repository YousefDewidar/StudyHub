import 'package:flutter/material.dart';

class Course {
  final String sub;
  final String disc;
  final String img;
  final String numLec;
  final String numSec;
  final Color boxColor;
  final List<Map<String?, String?>> lectures;
  final List<Map<String?, String?>> sections;
  final List<String?> exams;

  Course({
    required this.sub,
    required this.numLec,
    required this.numSec,
    required this.disc,
    required this.boxColor,
    required this.img,
    required this.lectures,
    required this.sections,
    required this.exams,
  });

  Map<String, dynamic> toJson() {
    return {
      'sub': sub,
      'disc': disc,
      'img': img,
      'numLec': numLec,
      'numSec': numSec,
      'boxColor': boxColor.value,
      'exams': exams,
      'sections': sections,
      'lectures': lectures,
    };
  }

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      sub: json['sub'] as String,
      disc: json['disc'] as String,
      img: json['img'] as String,
      numLec: json['numLec'] as String,
      numSec: json['numSec'] as String,
      boxColor: Color(json['boxColor'] as int),
      lectures: json['lectures'],
      sections: json['sections'],
      exams: json['exams'],
    );
  }
}
