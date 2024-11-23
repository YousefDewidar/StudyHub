import 'package:computers/core/utils/space.dart';
import 'package:computers/features/auth/data/repo/auth_repo.dart';
import 'package:computers/features/auth/ui/widgets/custom_button.dart';
import 'package:computers/features/auth/ui/widgets/custom_text_field.dart';
import 'package:computers/features/auth/ui/widgets/password_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final TextEditingController emailCon = TextEditingController();
  final TextEditingController passwordCon = TextEditingController();
  final TextEditingController nameCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            CustomTextField(
              label: 'Name',
              icon: Icons.person,
              controller: nameCon,
            ),
            const SpaceV(15),

            // email
            CustomTextField(
              label: 'Email',
              icon: Icons.email_outlined,
              controller: emailCon,
            ),
            const SpaceV(15),

            // password
            PasswordField(
              controller: passwordCon,
            ),
            const SpaceV(40),

            CustomButton(
              onPressed: () async {
                await registerLogic(context);
              },
              text: 'Register',
            ),
          ],
        ));
  }

  Future<void> registerLogic(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      try {
        await AuthRepo.register(emailCon, passwordCon);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('CreatedDone'),
            duration: Duration(seconds: 2),
          ),
        );
        // Database.addUser(
        //   email: emailCon.text,
        //   name: nameCon.text,
        //   location: 'Fixed location',
        //   number: 'number',
        // );
        // Navigator.pop(context);
      } on FirebaseAuthException {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed!'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}
