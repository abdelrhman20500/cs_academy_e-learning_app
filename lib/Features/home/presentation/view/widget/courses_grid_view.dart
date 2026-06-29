import 'package:cs_academy_e_learning_app/Features/home/data/model/course_model.dart';
import 'package:cs_academy_e_learning_app/Features/home/presentation/view/widget/courses_card.dart';
import 'package:flutter/material.dart';

class CoursesGridView extends StatelessWidget {
  const CoursesGridView({super.key, required this.model});

  final List<CourseModel> model;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 14.0,
        mainAxisSpacing: 14.0,
        childAspectRatio: 2.4 / 4.0,
      ),
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return CoursesCard(
            title: model[index].title,
            description: model[index].desc,
            price: model[index].price,
            id: model[index].id,
            imageUrl: model[index].image,
          );
        },
        childCount: model.length,
      ),
    );
  }
}