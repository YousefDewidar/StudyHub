import 'package:computers/core/utils/space.dart';
import 'package:computers/features/auth/ui/widgets/signup_form.dart';
import 'package:flutter/material.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SpaceV(50),
                Image.asset("assets/logo/logo_splash.png", height: 160),
                const Text(
                  'StudyHub',
                  style: TextStyle(fontSize: 35),
                ),
                Text(
                  'Your ultimate academic companion',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SpaceV(18),
                const SignupForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// 