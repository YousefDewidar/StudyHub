import 'package:computers/core/utils/my_colors.dart';
import 'package:computers/core/utils/space.dart';
import 'package:computers/features/home/ui/widgets/exam%20counter/time_data.dart';
import 'package:flutter/material.dart';

class ExamCounter extends StatelessWidget {
  const ExamCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding:
              const EdgeInsets.only(top: 23, bottom: 25, left: 15, right: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: MyColors.deepBlue,
          ),
          child: Column(
            children: [
              Text(
                "Are you ready for exams?",
                style: TextStyle(color: MyColors.kBackG, fontSize: 20),
              ),
              const SpaceV(15),
              const TimeDataWidget(),
            ],
          ),
        ),
        Positioned(
          right: -28,
          top: -27,
          child: Image.asset(
            "assets/images/star.png",
            width: 85,
            height: 60,
          ),
        ),
      ],
    );
  }
}
