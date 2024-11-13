import 'package:computers/features/home/ui/widgets/student%20res/student_res_card.dart';
import 'package:flutter/material.dart';

class StudentResourcesListView extends StatelessWidget {
  const StudentResourcesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .11,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          StudentResourcesCard(
            title: "YouTube\nChannel",
          ),
          StudentResourcesCard(
            title: "Tasks",
          ),
          StudentResourcesCard(
            title: "Exam\nSchedule",
          ),
          StudentResourcesCard(
            title: "Timetable",
          ),
        ],
      ),
    );
  }
}
