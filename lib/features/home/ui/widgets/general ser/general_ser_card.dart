import 'package:computers/core/utils/my_colors.dart';
import 'package:flutter/material.dart';

class GeneralSerCard extends StatelessWidget {
  const GeneralSerCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .8,
      height: MediaQuery.of(context).size.height * .5,
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: MyColors.deepBlue.withOpacity(.95),
          gradient: LinearGradient(colors: [
            MyColors.deepBlue,
            MyColors.deepBlue.withOpacity(.9),
          ])),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            "assets/images/focus_zone.png",
            width: 100,
          ),
          Text(
            "Focus\nZone",
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: MyColors.kBackG,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
