import 'package:cs_academy_e_learning_app/Features/home/data/model/course_model.dart';
import 'package:flutter/material.dart';
import 'my_courses_card.dart';

class MyCoursesList extends StatelessWidget {
  const MyCoursesList({super.key, required this.model});

  final List<CourseModel> model;
  @override
  Widget build(BuildContext context) {
    return  SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return Padding(
            padding: EdgeInsets.all(4.0),
            child: MyCoursesCard(
              imageUrl: model[index].image,
              title: model[index].title,
            ),
          );
        },
        childCount: model.length,
      ),
    );
  }
}