import 'package:computers/core/firebase/database.dart';
import 'package:computers/core/utils/my_colors.dart';
import 'package:computers/core/utils/space.dart';
import 'package:computers/core/utils/strings.dart';
import 'package:computers/features/courses/data/models/course.dart';
import 'package:computers/features/courses/ui/widgets/course_item.dart';
import 'package:flutter/material.dart';

class CoursesView extends StatelessWidget {
  const CoursesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
        ),
        scrolledUnderElevation: 0,
        title: const Text(
          "My Courses",
          style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: FutureBuilder<List<Map<String, dynamic>>>(
              future: Database.getAllDataCourses(Strings.coursesCol),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.separated(
                    padding: const EdgeInsets.only(top: 10),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) => CourseItem(
                      course: Course.fromJson(snapshot.data![index]),
                    ),
                    separatorBuilder: (context, index) => const SpaceV(20),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Center(
                      child: CircularProgressIndicator(
                    color: MyColors.primary,
                  ));
                } else {
                  return const Center(
                    child: Text('No Data!'),
                  );
                }
              }),
        ),
      ),
    );
  }
}
