import 'package:computers/core/utils/my_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            foregroundColor: const WidgetStatePropertyAll(Colors.black),
            backgroundColor: WidgetStatePropertyAll(MyColors.primary),
            shape: const WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)))),
            padding: const WidgetStatePropertyAll(EdgeInsets.all(20))),
        onPressed: onPressed,
        child: Center(
          child: Text(text.toUpperCase()),
        ));
  }
}
