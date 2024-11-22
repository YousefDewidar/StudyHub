import 'package:computers/core/utils/space.dart';
import 'package:computers/features/courses/ui/courses_view.dart';
import 'package:computers/features/home/ui/widgets/features%20grid/feature_item.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class FeaturesGridView extends StatelessWidget {
  const FeaturesGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FeatureItem(
          image: 'assets/images/agenda.png',
          title: "My Agenda",
          onTap: () {},
        ),
        const SpaceH(10),
        FeatureItem(
          image: 'assets/images/math.png',
          title: "Courses",
          onTap: () {
            Navigator.push(
                context,
                PageTransition(
                    child: const CoursesView(),
                    type: PageTransitionType.rightToLeft));
          },
        ),
      ],
    );
  }
}
