import 'package:computers/features/home/ui/widgets/custom_app_bar.dart';
import 'package:computers/features/home/ui/widgets/exam%20counter/exam_counter.dart';
import 'package:computers/features/home/ui/widgets/features%20grid/feature_grid_view.dart';
import 'package:computers/features/home/ui/widgets/year_card.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              CustomAppBar(),
              ExamCounter(),
              SizedBox(height: 15),
              YearCard(),
              SizedBox(height: 15),
              FeaturesGridView(),
            ],
          ),
        ),
      ),
    );
  }
}
