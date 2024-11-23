import 'package:flutter/material.dart';

class Course {
  final String sub;
  final String disc;
  final String img;

  final Color boxColor;
  final List<dynamic>? lectures;
  final List<dynamic>? sections;
  final List<dynamic>? exams;

  Course({
    required this.sub,
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
      boxColor: Color(json['boxColor'] as int),
      lectures: json['lectures'] as List<dynamic>?,
      sections: json['sections'] as List<dynamic>?,
      exams: json['exams'] as List<dynamic>?,
    );
  }
}
