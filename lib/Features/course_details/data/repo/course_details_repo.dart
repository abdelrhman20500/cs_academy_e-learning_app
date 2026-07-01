import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CourseDetailsRepo {
  final supabase = Supabase.instance.client;
  Future<Either<String, void>> enrollCourse(courseId, userId) async {
    try {
      final response = await supabase.from("Enrollments").insert({
        "course_id": courseId,
        "user_id": userId,
      });
      return right(null);
    } catch (e) {
      return left(e.toString());
    }
  }
  Future<Either<String, bool>> checkEnrollment({required String courseId,
    required String userId})async{
    try {
      final res = await supabase.from("Enrollments")
          .select()
          .eq("course_id", courseId)
          .eq("user_id", userId)
          .maybeSingle();
      return right(res != null);
    }catch (e) {
      return left(e.toString());
    }
  }
}
