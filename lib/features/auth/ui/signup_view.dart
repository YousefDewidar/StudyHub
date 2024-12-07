import 'package:computers/core/utils/space.dart';
import 'package:computers/features/auth/logic/cubit/auth_cubit.dart';
import 'package:computers/features/auth/ui/widgets/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SpaceV(50),
                  Image.asset("assets/logo/logo_splash.png", height: 160),
                  const Text('StudyHub', style: TextStyle(fontSize: 35)),
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
      ),
    );
  }
}

// 