import 'package:cs_academy_e_learning_app/Features/course_details/data/repo/course_details_repo.dart';
import 'package:cs_academy_e_learning_app/Features/course_details/presentation/view_manger/course_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseDetailsCubit extends Cubit<EnrollState> {
  CourseDetailsCubit(this.courseDetailsRepo) : super(EnrollInitial());
  final CourseDetailsRepo courseDetailsRepo;
  Future<void> enrollCourse(
      {required String courseId, required String userId}) async {
    emit(EnrollLoading());
    final result = await courseDetailsRepo.enrollCourse(courseId, userId);
    result.fold((e) {
      print(e.toString());
      emit(EnrollFailure(error: e.toString()));
    }, (_) {
      emit(EnrollSuccess());
    });
  }

  Future<void> checkEnrollment(
      {required String courseId, required String userId}) async {
    final result = await courseDetailsRepo.checkEnrollment(
        courseId: courseId, userId: userId);
    result.fold((e) {
      emit(EnrollFailure(error: e.toString()));
    }, (isEnrolled) {
      if (isEnrolled) {
        emit(AlreadyEnrollState());
      } else {
        emit(NotEnrollState());
      }
    });
  }
}
