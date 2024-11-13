import 'package:computers/core/utils/my_colors.dart';
import 'package:computers/features/splash/splash_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const StudyHub());
}

class StudyHub extends StatelessWidget {
  const StudyHub({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
        scaffoldBackgroundColor: MyColors.kBackG,
        fontFamily: 'Cairo',
      ),
      home: const SplashView(),
    );
  }
}


