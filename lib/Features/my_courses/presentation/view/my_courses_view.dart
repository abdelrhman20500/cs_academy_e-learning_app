import 'package:cs_academy_e_learning_app/Core/constants/app_color.dart';
import 'package:cs_academy_e_learning_app/Core/theme/app_theme.dart';
import 'package:cs_academy_e_learning_app/Features/my_courses/data/repo/my_courses_repo.dart';
import 'package:cs_academy_e_learning_app/Features/my_courses/presentation/view/widget/my_courses_list.dart';
import 'package:cs_academy_e_learning_app/Features/my_courses/presentation/view_manager/my_courses_cubit.dart';
import 'package:cs_academy_e_learning_app/Features/my_courses/presentation/view_manager/my_courses_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCoursesView extends StatelessWidget {
  const MyCoursesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyCoursesCubit(MyCoursesRepo())..getMyCourses(),
      child: BlocConsumer<MyCoursesCubit, MyCoursesState>(
        listener: (context, state) {
          if (state is MyCoursesFailure) {
            debugPrint(state.error);
          }
        },
        builder: (context, state) {
          Widget child;
          if (state is MyCoursesLoading) {
            child = const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            );
          } else if (state is MyCoursesFailure) {
            child = Center(
              child: Text(state.error),
            );
          } else if (state is MyCoursesSuccess) {
            child = state.model.isEmpty
                ? const Center(child: Text("Not Enrolled Courses"))
                : CustomScrollView(
                    slivers: [
                      const SliverToBoxAdapter(
                        child: SizedBox(height: 4),
                      ),
                      SliverToBoxAdapter(
                        child: Container(
                          height: 66,
                          decoration: const BoxDecoration(
                            color: AppColors.primaryColor,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Completed Courses",
                                style: AppTheme.textStyle24
                                    .copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SliverToBoxAdapter(
                        child: SizedBox(height: 4),
                      ),
                      MyCoursesList(model: state.model),
                    ],
                  );
          } else {
            child = const SizedBox();
          }

          return Container(
            color: Colors.grey.withOpacity(0.3),
            child: child,
          );
        },
      ),
    );
  }
}