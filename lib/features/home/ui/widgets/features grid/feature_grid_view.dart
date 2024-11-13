import 'package:computers/core/utils/space.dart';
import 'package:computers/features/home/ui/widgets/features%20grid/feature_item.dart';
import 'package:flutter/material.dart';

class FeaturesGridView extends StatelessWidget {
  const FeaturesGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FeatureItem(
          image: 'assets/images/agenda.png',
          title: "My Agenda",
        ),
        SpaceH(10),
        FeatureItem(
          image: 'assets/images/math.png',
          title: "Courses",
        ),
      ],
    );
  }
}
