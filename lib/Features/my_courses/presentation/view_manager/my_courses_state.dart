import 'package:cs_academy_e_learning_app/Features/home/data/model/course_model.dart';

abstract class MyCoursesState{}
class MyCoursesInitial extends MyCoursesState{}
class MyCoursesLoading extends MyCoursesState{}
class MyCoursesFailure extends MyCoursesState{
  final String error;
  MyCoursesFailure({required this.error});
}
class MyCoursesSuccess extends MyCoursesState{
  final List<CourseModel> model;
  MyCoursesSuccess({required this.model});
}