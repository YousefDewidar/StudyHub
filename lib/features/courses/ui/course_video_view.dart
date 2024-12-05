import 'package:computers/features/courses/data/models/course.dart';
import 'package:computers/features/courses/ui/widgets/comments_list_view.dart';
import 'package:computers/features/courses/ui/widgets/youtube_widget.dart';
import 'package:flutter/material.dart';

class CourseVideoView extends StatefulWidget {
  const CourseVideoView(
      {super.key, required this.name, required this.url, required this.course});
  final String name;
  final Course course;
  final String url;

  @override
  State<CourseVideoView> createState() => _CourseVideoViewState();
}

class _CourseVideoViewState extends State<CourseVideoView> {
  bool viewAll = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          YoutubeWidget(url: widget.url),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  " ${widget.name} ${widget.course.sub}",
                  style: const TextStyle(fontSize: 20),
                ),
                TextButton(
                    onPressed: () {
                      viewAll = !viewAll;
                      setState(() {});
                    },
                    child: Text(
                        viewAll ? "hide comments" : "show all comments"))
              ],
            ),
          ),
          CommentsListView(
            viewAll: viewAll,
          ),
        ],
      ),
    );
  }
}
