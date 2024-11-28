import 'package:flutter/material.dart';

class HelperFuns {
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showMessage(
      BuildContext context, String message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
