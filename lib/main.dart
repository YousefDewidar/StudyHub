import 'package:computers/core/utils/my_colors.dart';
import 'package:computers/features/auth/ui/signup_view.dart';
import 'package:computers/features/courses/ui/courses_view.dart';
import 'package:computers/features/splash/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Supabase.initialize(
    url: 'https://kbxiqlcrumsutgacszxj.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtieGlxbGNydW1zdXRnYWNzenhqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzMyNzg2NjksImV4cCI6MjA0ODg1NDY2OX0.Mno6Tcgj1rXuMfOGBM6c2yUM9dPYD1gbTB3swoDLpyg',
  );
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
        "signupView": (context) => const SignupView(),
      },
      initialRoute: "/",
    );
  }
}
