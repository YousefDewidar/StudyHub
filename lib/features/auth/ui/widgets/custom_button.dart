import 'package:computers/core/utils/my_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final bool isLoading;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            foregroundColor: const WidgetStatePropertyAll(Colors.black),
            backgroundColor: WidgetStatePropertyAll(MyColors.primary),
            shape: const WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)))),
            padding: const WidgetStatePropertyAll(EdgeInsets.all(15))),
        onPressed: onPressed,
        child: Center(
          child: isLoading
              ? const SizedBox(
                  height: 22,
                  width: 22,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
              : Text(
                  text.toUpperCase(),
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
        ));
  }
}
