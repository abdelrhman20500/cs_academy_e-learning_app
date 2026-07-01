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
          if(state is MyCoursesLoading){
            const Center(child: CircularProgressIndicator());
          }
          if(state is MyCoursesFailure) {
            print(state.error);
          }
        },
        builder: (context, state) {
          return Container(
            color: Colors.grey.withOpacity(0.3),
            child: state is MyCoursesSuccess ?
              state.model.isEmpty ? const Center(child: Text("Not Enrolled Courses")) :
            CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(child: SizedBox(height: 4),),
                SliverToBoxAdapter(
                  child: Container(
                    height: 66,
                    decoration: const BoxDecoration(
                      color: Colors.deepPurple,
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Completed Courses", style: AppTheme.textStyle24,),
                      ],
                    ),
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 4),),
                MyCoursesList(model: state.model,),
              ],
            ): const SizedBox()
          );
        },
      ),
    );
  }
}