import 'package:computers/core/utils/my_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final IconData icon;
  final TextEditingController controller;

  const CustomTextField({
    super.key,
    required this.label,
    required this.icon,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        return handleValidation(value);
      },
      decoration: customInputDecoration(),
    );
  }

  InputDecoration customInputDecoration() {
    return InputDecoration(
        prefixIcon: Icon(
          icon,
          color: MyColors.primary,
        ),
        contentPadding: const EdgeInsets.all(17),
        labelText: label,
        floatingLabelStyle: TextStyle(fontSize: 18, color: MyColors.primary),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: MyColors.primary)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)));
  }

  String? handleValidation(String? value) {
    if (value!.isEmpty && label == 'University Email') {
      return 'Please enter your email';
    } else if (value.isEmpty && label == 'Full Name') {
      return 'Please enter your Name';
    } else {
      return null;
    }
  }
}
