import 'package:cs_academy_e_learning_app/Features/home/data/repo/home_repo.dart';
import 'package:cs_academy_e_learning_app/Features/home/presentation/view_manager/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());

  final HomeRepo homeRepo;
  Future<void> getCourses() async {
    emit(HomeLoading());
    final response = await homeRepo.getCourses();
    response.fold((e) {
      emit(HomeFailure(error: e.toString()));
    }, (courseModel) {
      emit(HomeSuccess(courseModel: courseModel));
    });
  }
}
