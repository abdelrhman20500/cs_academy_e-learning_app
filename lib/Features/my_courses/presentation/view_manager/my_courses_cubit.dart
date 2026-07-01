import 'package:cs_academy_e_learning_app/Features/my_courses/data/repo/my_courses_repo.dart';
import 'package:cs_academy_e_learning_app/Features/my_courses/presentation/view_manager/my_courses_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCoursesCubit extends Cubit<MyCoursesState>{
  MyCoursesCubit(this.myCoursesRepo) :super(MyCoursesInitial());
  final MyCoursesRepo myCoursesRepo;

  Future<void> getMyCourses()async{
    emit(MyCoursesLoading());
    final result= await myCoursesRepo.getCourses();
    result.fold((e){
      emit(MyCoursesFailure(error: e.toString()));
    }, (model){
      emit(MyCoursesSuccess(model: model));
    });
  }
}