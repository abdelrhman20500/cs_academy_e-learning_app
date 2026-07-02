import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cs_academy_e_learning_app/Features/course_video/data/repo/course_video_repo.dart';
import 'course_video_state.dart';

class CourseVideoCubit extends Cubit<CourseVideoState> {
  final CourseVideoRepo courseVideoRepo;

  CourseVideoCubit(this.courseVideoRepo) : super(CourseVideoInitial());

  Future<void> getCourseVideo({required String courseId}) async {
    emit(CourseVideoLoading());

    final result = await courseVideoRepo.getCourseVideo(courseId: courseId);

    result.fold(
          (error) => emit(CourseVideoFailure(error: error)),
          (videos) => emit(CourseVideoSuccess(videos: videos)),
    );
  }
}