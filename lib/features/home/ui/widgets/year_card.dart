import 'package:computers/core/utils/my_colors.dart';
import 'package:flutter/material.dart';

class YearCard extends StatelessWidget {
  const YearCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              MyColors.primary.withOpacity(.8),
              MyColors.primary,
            ]),
      ),
      child: Center(
          child: Text(
        'Third year Computer'.toUpperCase(),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      )),
    );
  }
}
