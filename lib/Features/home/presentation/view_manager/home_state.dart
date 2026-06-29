import 'package:cs_academy_e_learning_app/Features/home/data/model/course_model.dart';

abstract class HomeState{}
class HomeInitial extends HomeState{}
class HomeLoading extends HomeState{}
class HomeFailure extends HomeState{
  final String error;
  HomeFailure({required this.error});
}
class HomeSuccess extends HomeState{
  final List<CourseModel> courseModel;
  HomeSuccess({required this.courseModel});
}