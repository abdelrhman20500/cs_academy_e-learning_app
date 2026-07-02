import 'package:cs_academy_e_learning_app/Features/course_video/data/model/course_video_model.dart';
import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CourseVideoRepo{
  final supabase= Supabase.instance.client;
  Future<Either<String, List<CourseVideoModel>>> getCourseVideo({required String courseId})async{
    try {
      final response = await supabase.from("videos").select()
          .eq("course_id", courseId);
      final List<CourseVideoModel> courseVideos =[];
      for(var courseVideo in response){
        courseVideos.add(CourseVideoModel.fromSupabase(courseVideo));
      }
      return right(courseVideos);
    } catch (e) {
      return left(e.toString());
    }
  }
}