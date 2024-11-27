import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:computers/core/firebase/database.dart';
import 'package:computers/core/utils/space.dart';
import 'package:computers/features/auth/data/model/user.dart';
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
  final SingleSelectController<String> levelCon = SingleSelectController(null);
  final List<String> level = const ['first', 'second', 'third', 'fourth'];

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              label: 'Full Name',
              icon: Icons.person,
              controller: nameCon,
            ),
            const SpaceV(10),

            // email
            CustomTextField(
              label: 'University Email',
              icon: Icons.email_outlined,
              controller: emailCon,
            ),
            const SpaceV(10),

            // password
            PasswordField(
              controller: passwordCon,
            ),
            const SpaceV(10),

            CustomDropdown<String>(
              items: level,
              hintText: 'Select your level in Computer Department',
              controller: levelCon,
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'Please enter your level';
                }
                return null;
              },
              decoration: CustomDropdownDecoration(
                hintStyle:
                    const TextStyle(color: Color.fromARGB(255, 89, 89, 89)),
                closedFillColor: Colors.transparent,
                closedBorder: Border.all(
                  color: const Color.fromARGB(170, 0, 0, 0),
                ),
              ),
              onChanged: (value) {},
            ),
            SpaceV(MediaQuery.of(context).size.height * .12),
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
        await _register(emailCon.text, passwordCon.text);
        Database.addUser(
          user: UserModel(
            fullName: nameCon.text,
            uniEmail: emailCon.text,
            password: passwordCon.text,
            level: levelCon.value!,
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('CreatedDone'), duration: Duration(seconds: 2)),
        );
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

  static Future<void> _register(String email, String password) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }
}
