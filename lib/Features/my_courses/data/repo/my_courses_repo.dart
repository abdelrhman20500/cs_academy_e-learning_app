import 'package:cs_academy_e_learning_app/Features/home/data/model/course_model.dart';
import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MyCoursesRepo{
  final supabase = Supabase.instance.client;
  Future<Either<String, List<CourseModel>>> getCourses()async{
    try {
      final currentUser = supabase.auth.currentUser;
      if (currentUser == null) {
        return left("User not logged in");
      }
      final response = await supabase.from("Enrollments").select("courses(*)")
      .eq("user_id", currentUser.id);
      List<CourseModel> courses =[];
      for(var course in response){
        courses.add(CourseModel.fromJson(course["courses"]));
      }
      return right(courses);
    }catch (e) {
      return left(e.toString());
    }
  }
}