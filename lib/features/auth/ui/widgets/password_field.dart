import 'package:computers/core/utils/my_colors.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;

  const PasswordField({
    super.key,
    required this.controller,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isVisable = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your password';
        }
        return null;
      },
      obscureText: isVisable,
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.password,
            color: MyColors.primary,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              isVisable = !isVisable;
              setState(() {});
            },
            icon: !isVisable
                ? const Icon(Icons.visibility)
                : const Icon(Icons.visibility_off),
          ),
          contentPadding: const EdgeInsets.all(17),
          labelText: 'Password',
          floatingLabelStyle: TextStyle(fontSize: 18, color: MyColors.primary),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: MyColors.primary)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
    );
  }
}
