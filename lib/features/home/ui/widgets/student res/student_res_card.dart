import 'package:computers/core/utils/my_colors.dart';
import 'package:computers/core/utils/space.dart';
import 'package:flutter/material.dart';

class StudentResourcesCard extends StatelessWidget {
  final String title;
  const StudentResourcesCard({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3 - 30,
      height: MediaQuery.of(context).size.height * .1,
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: MyColors.deepBlue.withOpacity(.1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SpaceV(5),
          Text(
            title,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: MyColors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
