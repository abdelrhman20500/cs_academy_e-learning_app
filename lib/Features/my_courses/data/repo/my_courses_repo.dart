import 'package:cs_academy_e_learning_app/Features/home/data/model/course_model.dart';
import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MyCoursesRepo{
  final supabase= Supabase.instance.client;
  final userId =Supabase.instance.client.auth.currentUser!.id;
  Future<Either<String, List<CourseModel>>> getCourses()async{
    try {
      final response = await supabase.from("Enrollments").select("courses(*)")
      .eq("user_id", userId);
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