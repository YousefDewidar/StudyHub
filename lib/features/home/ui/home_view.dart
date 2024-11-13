import 'package:computers/core/utils/my_colors.dart';

import 'package:computers/features/home/ui/widgets/custom_app_bar.dart';
import 'package:computers/features/home/ui/widgets/exam%20counter/exam_counter.dart';
import 'package:computers/features/home/ui/widgets/features%20grid/feature_grid_view.dart';
import 'package:computers/features/home/ui/widgets/general%20ser/general_list_view.dart';
import 'package:computers/features/home/ui/widgets/student%20res/student_res_listview.dart';
import 'package:computers/features/home/ui/widgets/year_card.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          selectedItemColor: MyColors.primary,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Courses'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ]),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            clipBehavior: Clip.none,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppBar(),
                const ExamCounter(),
                const SizedBox(height: 15),
                const YearCard(),
                const SizedBox(height: 15),
                const FeaturesGridView(),
                const SizedBox(height: 15),
                Text(
                  "Student Resources",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: MyColors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const StudentResourcesListView(),
                const SizedBox(height: 15),
                Text(
                  "General Services",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: MyColors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const GeneralSerListView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
