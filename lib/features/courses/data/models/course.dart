import 'package:flutter/material.dart';

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

  Map<String, dynamic> toJson() {
    return {
      'sub': sub,
      'disc': disc,
      'img': img,
      'numLec': numLec,
      'numSec': numSec,
      'boxColor': boxColor.value, // حفظ قيمة اللون كعدد
    };
  }

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      sub: json['sub'] as String,
      disc: json['disc'] as String,
      img: json['img'] as String,
      numLec: json['numLec'] as String,
      numSec: json['numSec'] as String,
      boxColor: Color(json['boxColor'] as int), // تحويل العدد إلى لون
    );
  }
}
