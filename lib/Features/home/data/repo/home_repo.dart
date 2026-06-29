import 'package:cs_academy_e_learning_app/Features/home/data/model/course_model.dart';
import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeRepo{
  List<CourseModel> courses =[];
  Future<Either<String, List<CourseModel>>> getCourses()async{
    try {
      final response = await Supabase.instance.client.from("courses").select();
      /// علشان الكورسات متتملاش مرتين في الليست لما تخرج وترجع للصفحة تاني
      courses =[];
      for(var course in response){
        courses.add(CourseModel.fromJson(course));
      }
      return right(courses);
    }catch (e) {
      return left(e.toString());
    }
  }
}