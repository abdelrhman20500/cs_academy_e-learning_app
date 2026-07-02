import 'package:cached_network_image/cached_network_image.dart';
import 'package:cs_academy_e_learning_app/Core/constants/app_color.dart';
import 'package:cs_academy_e_learning_app/Core/functions/snack_bar_message.dart';
import 'package:cs_academy_e_learning_app/Core/theme/app_theme.dart';
import 'package:cs_academy_e_learning_app/Core/widgets/custom_bottom.dart';
import 'package:cs_academy_e_learning_app/Features/course_details/data/repo/course_details_repo.dart';
import 'package:cs_academy_e_learning_app/Features/course_details/presentation/view_manger/course_details_cubit.dart';
import 'package:cs_academy_e_learning_app/Features/course_details/presentation/view_manger/course_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:cs_academy_e_learning_app/Features/course_video/presentation/view/course_video_view.dart';

class CourseDetailsView extends StatelessWidget {
  const CourseDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String id = args["id"];
    final String title = args["title"];
    final String imageUrl = args["imageUrl"];
    final String description = args["description"];
    final num price = args["price"];
    return BlocProvider(
      create: (context) => CourseDetailsCubit(CourseDetailsRepo())
        ..checkEnrollment(
          courseId: id,
          userId: Supabase.instance.client.auth.currentUser?.id ?? "",
        ),
      child: BlocConsumer<CourseDetailsCubit, EnrollState>(
        listener: (context, state) {
          if(state is EnrollFailure) {
            snackBarMessage(context: context, text: state.error);
          }
          if(state is EnrollSuccess){
            snackBarMessage(context: context,backgroundColor: Colors.green, text: "Enroll Success");
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.grey[100],
            appBar: AppBar(
              backgroundColor:Colors.white,
              elevation: 0,
              leading: IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: const Icon(Icons.arrow_back_ios)),
              title: Text("Course Details", style: AppTheme.textStyle20.copyWith(fontSize: 22),),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: imageUrl,
                        fit: BoxFit.fill,
                        height: height * 0.3, // Adjust height
                        width: double.infinity, // Full width
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: Colors.grey[700]!,
                          highlightColor: Colors.grey[500]!,
                          child: Container(
                            height: height * 0.3,
                            width: double.infinity,
                            color: Colors.grey,
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                      ),
                    ),
                    SizedBox(height: height*0.02,),
                    Text(title, style: AppTheme.textStyle24.copyWith(color: Colors.black),),
                    SizedBox(height: height*0.02,),
                    Text("${price.toString()} EGP", style: AppTheme.textStyle20.copyWith(color: Colors.green),),
                    SizedBox(height: height*0.02,),
                    const Text("Description", style: AppTheme.textStyle20,),
                    SizedBox(height: height*0.02,),
                    Text(description, style: AppTheme.textStyle18),
                    SizedBox(height: height*0.02,),
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: 50,
                        child: state is EnrollLoading
                            ? const Center(child: CircularProgressIndicator())
                            : CustomBottom(
                                text: state is AlreadyEnrollState || state is EnrollSuccess
                                    ? "Enrolled"
                                    : "Enroll Course",
                                backgroundColor: state is AlreadyEnrollState || state is EnrollSuccess
                                    ? Colors.green
                                    : AppColors.primaryColor,
                                onPressed: () {
                                  if (state is AlreadyEnrollState || state is EnrollSuccess) {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return CourseVideoView(courseId: id);
                                    }));
                                  } else {
                                    context.read<CourseDetailsCubit>().enrollCourse(
                                          courseId: id,
                                          userId: Supabase.instance.client.auth.currentUser!.id,
                                        );
                                  }
                                },
                                borderRadius: BorderRadius.circular(12.0),
                                width: double.infinity,
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
