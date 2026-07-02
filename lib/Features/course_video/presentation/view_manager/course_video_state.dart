import 'package:cs_academy_e_learning_app/Features/course_video/data/model/course_video_model.dart';

abstract class CourseVideoState {}

class CourseVideoInitial extends CourseVideoState {}

class CourseVideoLoading extends CourseVideoState {}

class CourseVideoSuccess extends CourseVideoState {
  final List<CourseVideoModel> videos;
  CourseVideoSuccess({required this.videos});
}

class CourseVideoFailure extends CourseVideoState {
  final String error;
  CourseVideoFailure({required this.error});
}