import 'package:cs_academy_e_learning_app/Features/course_video/data/model/course_video_model.dart';
import 'package:flutter/material.dart';
import 'lesson_card.dart';

class CourseVideoListView extends StatelessWidget {
  const CourseVideoListView({super.key, required this.model,});

  final List<CourseVideoModel> model;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      itemCount: model.length,
      itemBuilder: (context, index) {
        return LessonCard(
          title: model[index].title,
          desc: model[index].desc,
          url: model[index].urlVideo,
        );
      },
    );
  }
}