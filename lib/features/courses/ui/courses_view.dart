import 'package:computers/core/utils/space.dart';
import 'package:computers/features/courses/data/models/course.dart';
import 'package:computers/features/courses/ui/widgets/course_item.dart';
import 'package:flutter/material.dart';

class CoursesView extends StatelessWidget {
  const CoursesView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Course> coursesList = [
      Course(
        sub: "Database",
        img: 'assets/images/courses/db.png',
        disc: 'Learn to design and manage databases efficiently.',
        boxColor: const Color(0xff7383C0),
        numLec: "5",
        numSec: "6",
      ),
      Course(
        sub: "Operating system",
        img: 'assets/images/courses/os.png',
        disc: 'Understand the core concepts of operating systems.',
        boxColor: const Color(0xff52C3FF),
        numLec: "5",
        numSec: "6",
      ),
      Course(
        sub: "Control",
        img: 'assets/images/courses/rb_6.png',
        disc: 'Explore control systems and their applications.',
        boxColor: const Color(0xffE8B761),
        numLec: "5",
        numSec: "6",
      ),
      Course(
        sub: "Stochastic",
        img: 'assets/images/courses/stoc.png',
        disc: 'Dive into stochastic processes and probability theory.',
        numLec: "5",
        numSec: "6",
        boxColor: Colors.teal,
      ),
      Course(
        sub: "Compilers",
        img: 'assets/images/math.png',
        disc: 'Learn how compilers work and optimize code.',
        numLec: "5",
        numSec: "6",
        boxColor: const Color(0xff7383C0),
      ),
      Course(
        sub: "DSP",
        img: 'assets/images/courses/rb_6.png',
        disc: 'Understand the fundamentals of digital signal processing.',
        numLec: "5",
        numSec: "6",
        boxColor: const Color(0xff52C3FF),
      ),
    ];

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
          child: ListView.separated(
            padding: const EdgeInsets.only(top: 10),
            itemCount: coursesList.length,
            itemBuilder: (context, index) => CourseItem(
              course: coursesList[index],
            ),
            separatorBuilder: (context, index) => const SpaceV(20),
          ),
        ),
      ),
    );
  }
}
