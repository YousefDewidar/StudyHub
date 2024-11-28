import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:computers/core/utils/space.dart';
import 'package:computers/features/auth/logic/cubit/auth_cubit.dart';
import 'package:computers/features/auth/logic/cubit/auth_state.dart';
import 'package:computers/features/auth/ui/widgets/custom_button.dart';
import 'package:computers/features/auth/ui/widgets/custom_text_field.dart';
import 'package:computers/features/auth/ui/widgets/password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  bool isLoading = false;

  @override
  void dispose() {
    emailCon.dispose();
    passwordCon.dispose();
    nameCon.dispose();
    levelCon.dispose();
    super.dispose();
  }

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
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is RegisterLoading) {
                  isLoading = true;
                } else if (state is RegisterFailuer) {
                  isLoading = false;
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Failed!'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                } else if (state is RegisterSuccess) {
                  isLoading = false;
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Created Done'),
                        duration: Duration(seconds: 2)),
                  );
                }
              },
              builder: (context, state) {
                return CustomButton(
                  text: 'Register',
                  isLoading: isLoading,
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      BlocProvider.of<AuthCubit>(context).createUser(
                        email: emailCon.text,
                        password: passwordCon.text,
                        name: nameCon.text,
                        level: levelCon.value!,
                      );
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                );
              },
            ),
          ],
        ));
  }
}
