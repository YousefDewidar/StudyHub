import 'package:computers/features/courses/data/models/course.dart';
import 'package:computers/features/courses/ui/widgets/exam_card.dart';
import 'package:computers/features/courses/ui/widgets/lec_card.dart';
import 'package:flutter/material.dart';

class CourseDetailsView extends StatefulWidget {
  final Course course;
  const CourseDetailsView({super.key, required this.course});

  @override
  State<CourseDetailsView> createState() => _CourseDetailsViewState();
}

class _CourseDetailsViewState extends State<CourseDetailsView>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  String courseType = "Lec";
  late List? courseList;

  @override
  void initState() {
    courseList = widget.course.lectures;
    controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
        title: Text(
          widget.course.sub,
          style:
              const TextStyle(fontWeight: FontWeight.w700, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              TabBar(
                onTap: (value) {
                  if (value == 0) {
                    courseType = "Lec";
                    courseList = widget.course.lectures;
                  } else if (value == 1) {
                    courseType = "Sec";
                    courseList = widget.course.sections;
                  } else {
                    courseType = "Exam";
                    courseList = widget.course.exams;
                  }
                  setState(() {});
                },
                labelColor: Colors.black,
                indicatorColor: Colors.black,
                controller: controller,
                tabs: [
                  Tab(
                    text: 'Lectures',
                    icon: CustomCircle(
                      num: widget.course.lectures?.length.toString() ?? "0",
                    ),
                  ),
                  Tab(
                    text: 'Sections',
                    icon: CustomCircle(
                      num: widget.course.sections?.length.toString() ?? "0",
                    ),
                  ),
                  Tab(
                    text: 'Exams',
                    icon: CustomCircle(
                      num: widget.course.exams?.length.toString() ?? "0",
                    ),
                  ),
                ],
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: courseList?.length ?? 0,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 2 / 2.2,
                  ),
                  itemBuilder: (context, index) {
                    return courseType == "Exam"
                        ? ExamCard(index: index, pdfLink: courseList?[index])
                        : LectureCard(
                            course: widget.course,
                            typeCourse: courseType,
                            index: index,
                            pdfLink: courseList?[index]['pdf'],
                            vidLink: courseList?[index]['vid'],
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCircle extends StatelessWidget {
  const CustomCircle({
    super.key,
    required this.num,
  });

  final String num;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 13,
      backgroundColor: Colors.black,
      child: Text(
        num,
        style: const TextStyle(fontSize: 13, color: Colors.white),
      ),
    );
  }
}
