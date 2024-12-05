import 'package:computers/core/utils/space.dart';
import 'package:computers/features/courses/ui/widgets/comment_card.dart';
import 'package:flutter/material.dart';

class CommentsListView extends StatelessWidget {
  const CommentsListView({
    super.key,
    required this.viewAll,
  });
  final bool viewAll;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      itemCount: viewAll ? 5 : 1,
      itemBuilder: (context, index) => const CommentCard(),
      separatorBuilder: (context, index) => const SpaceV(5),
    ));
  }
}
