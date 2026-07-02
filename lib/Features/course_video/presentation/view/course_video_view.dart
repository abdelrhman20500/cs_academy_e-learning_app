import 'package:cs_academy_e_learning_app/Core/theme/app_theme.dart';
import 'package:cs_academy_e_learning_app/Features/course_video/data/repo/course_video_repo.dart';
import 'package:cs_academy_e_learning_app/Features/course_video/presentation/view/widget/course_video_list_view.dart';
import 'package:cs_academy_e_learning_app/Features/course_video/presentation/view_manager/course_video_cubit.dart';
import 'package:cs_academy_e_learning_app/Features/course_video/presentation/view_manager/course_video_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseVideoView extends StatelessWidget {
  const CourseVideoView({super.key, required this.courseId});

  final String courseId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CourseVideoCubit(CourseVideoRepo())
        ..getCourseVideo(courseId: courseId),
      child: BlocConsumer<CourseVideoCubit, CourseVideoState>(
        listener: (context, state) {
          if (state is CourseVideoFailure) {
            print(state.error);
          }
        },
        builder: (context, state) {
          if (state is CourseVideoLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is CourseVideoFailure) {
            Center(child: Text("Error: ${state.error}", style: const TextStyle(color: Colors.red),),);
          }
          if (state is CourseVideoSuccess) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                title: const Text('Course Videos', style: AppTheme.textStyle24),
                leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.black87),
                ),
              ),
              body: state.videos.isEmpty
                  ? const Center(child: Text("No Videos yet"))
                  : CourseVideoListView(model: state.videos,),
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}