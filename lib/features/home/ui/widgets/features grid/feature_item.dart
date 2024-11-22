import 'package:computers/core/utils/my_colors.dart';
import 'package:computers/core/utils/space.dart';
import 'package:flutter/material.dart';

class FeatureItem extends StatelessWidget {
  final String title;
  final String image;
  final void Function()? onTap;

  const FeatureItem({
    super.key,
    required this.title,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width / 2 - 30,
        height: MediaQuery.of(context).size.height * .19,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: MyColors.deepBlue.withOpacity(.1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              height: 80,
            ),
            const SpaceV(5),
            Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: MyColors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
