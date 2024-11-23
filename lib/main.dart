import 'package:computers/core/utils/my_colors.dart';
import 'package:computers/features/auth/ui/signup_view.dart';
import 'package:computers/features/courses/ui/courses_view.dart';
import 'package:computers/features/splash/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const StudyHub());
}

class StudyHub extends StatelessWidget {
  const StudyHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: MyColors.kBackG,
        fontFamily: 'Cairo',
      ),
      routes: {
        "/": (context) => const SplashView(),
        "courses_view": (context) => const CoursesView(),
        "SignupView": (context) => const SignupView(),
      },
      initialRoute: "/",
    );
  }
}
