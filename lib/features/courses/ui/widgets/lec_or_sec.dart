import 'package:computers/core/utils/my_colors.dart';
import 'package:computers/core/utils/space.dart';
import 'package:flutter/material.dart';

class LecOrSecOrExamWidget extends StatelessWidget {
  const LecOrSecOrExamWidget({
    super.key,
    required this.num,
    this.onTap,
    required this.title,
  });

  final void Function()? onTap;
  final String num;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(6),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: MyColors.black.withOpacity(.8),
        ),
        child: Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
            const SpaceH(10),
            CircleAvatar(
              radius: 12,
              backgroundColor: Colors.white,
              child: Text(
                num,
                style: const TextStyle(color: Color.fromARGB(199, 0, 0, 0)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
