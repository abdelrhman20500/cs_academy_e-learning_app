import 'package:cs_academy_e_learning_app/Core/constants/app_color.dart';
import 'package:cs_academy_e_learning_app/Core/theme/app_theme.dart';
import 'package:cs_academy_e_learning_app/Core/widgets/custom_text_form_field.dart';
import 'package:cs_academy_e_learning_app/Features/home/data/repo/home_repo.dart';
import 'package:cs_academy_e_learning_app/Features/home/presentation/view/widget/courses_grid_view.dart';
import 'package:cs_academy_e_learning_app/Features/home/presentation/view_manager/home_cubit.dart';
import 'package:cs_academy_e_learning_app/Features/home/presentation/view_manager/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  Future<String> _getUserName() async {
    try {
      final currentUser = Supabase.instance.client.auth.currentUser;
      if (currentUser == null) return "Guest";

      final metadataName = currentUser.userMetadata?['name'] ?? currentUser.userMetadata?['full_name'];
      if (metadataName != null) {
        return metadataName.toString();
      }

      final response = await Supabase.instance.client
          .from("users")
          .select("name")
          .eq("id", currentUser.id)
          .maybeSingle();

      if (response != null && response["name"] != null) {
        return response["name"].toString();
      }
    } catch (_) {}
    return "User";
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => HomeCubit(HomeRepo())..getCourses(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12.0),
                      bottomRight: Radius.circular(12.0),
                    ),
                    child: Container(
                      height: height * 0.22,
                      decoration: const BoxDecoration(
                        color: AppColors.primaryColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FutureBuilder<String>(
                              future: _getUserName(),
                              builder: (context, snapshot) {
                                final String name = snapshot.data ?? "User";
                                return Text(
                                  "Welcome $name",
                                  style: AppTheme.textStyle18.copyWith(color: Colors.white),
                                );
                              },
                            ),
                            SizedBox(height: height * 0.014),
                            const Text("Welcome To Learning App", style: AppTheme.textStyle22,),
                            SizedBox(height: height * 0.014),
                            const CustomTextFormField(
                              prefixIcon: Icon(Icons.search),
                              hintText: "What are your look for ?",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: height * 0.01)),
                if (state is HomeLoading)
                  const SliverToBoxAdapter(
                    child: Center(child: CircularProgressIndicator()),
                  ),
                if (state is HomeFailure)
                  SliverToBoxAdapter(
                    child: Center(
                      child: Text("Error: ${state.error}",
                        style: const TextStyle(color: Colors.red, fontSize: 18),),
                    ),
                  ),
                if (state is HomeSuccess)
                  state.courseModel.isEmpty ? const SliverToBoxAdapter(
                    child: Center(
                      child: Text("No courses available at the moment", style: TextStyle(
                          fontSize: 18,fontWeight: FontWeight.w600,color: Colors.grey,),),),
                  ) : CoursesGridView(model: state.courseModel),
              ],
            ),
          );
        },
      ),
    );
  }
}
