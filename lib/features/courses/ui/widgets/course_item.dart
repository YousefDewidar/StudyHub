import 'package:computers/core/utils/space.dart';
import 'package:computers/features/courses/data/models/course.dart';
import 'package:computers/features/courses/ui/course_details_view.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class CourseItem extends StatelessWidget {
  const CourseItem({super.key, required this.course});
  final Course course;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(26),
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
            child: CourseDetailsView(course: course),
            type: PageTransitionType.fade,
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 22),
        decoration: BoxDecoration(
          color: course.boxColor,
          borderRadius: BorderRadius.circular(26),
        ),
        child: Row(
          children: [
            Image.asset(
              course.img,
              width: MediaQuery.of(context).size.width * .35 - 20,
              height: 100,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.sub,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SpaceV(3),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .65 - 50,
                    child: Text(
                      course.disc,
                      style: const TextStyle(
                          color: Color.fromARGB(250, 255, 255, 255),
                          fontSize: 15,
                          height: 1.1),
                    ),
                  ),
                  const SpaceV(15),
                  const Divider(
                    color: Color.fromARGB(139, 255, 255, 255),
                    endIndent: 20,
                  ),
                  const SpaceV(10),
                  Text.rich(
                    TextSpan(
                      style: const TextStyle(
                          height: .2, color: Colors.white, fontSize: 15),
                      children: [
                        TextSpan(
                          text: "Lec ${course.lectures?.length ?? 0}",
                        ),
                        const TextSpan(
                          text: "         ",
                        ),
                        TextSpan(
                          text: "Sec ${course.sections?.length ?? 0}",
                        ),
                        const TextSpan(
                          text: "         ",
                        ),
                        TextSpan(
                          text: "Exams ${course.exams?.length ?? 0}",
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
