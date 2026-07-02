import 'package:cs_academy_e_learning_app/Core/Routing/routes.dart';
import 'package:cs_academy_e_learning_app/Features/auth/presentation/view/sign_up_view.dart';
import 'package:cs_academy_e_learning_app/Features/course_details/presentation/view/course_details_view.dart';
import 'package:cs_academy_e_learning_app/Features/layout/presentation/view/layout_view.dart';
import 'package:flutter/material.dart';
import '../../Features/auth/presentation/view/login_view.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginView:
        return MaterialPageRoute(builder: (_) => LoginView());
      case Routes.signUpView:
        return MaterialPageRoute(builder: (_) => SignUpView());
      case Routes.layoutView:
        return MaterialPageRoute(builder: (_) => const LayoutView());
      case Routes.courseDetailsView:
        return MaterialPageRoute(builder: (_) => const CourseDetailsView(),
          settings: settings,);
      // case Routes.courseVideoView:
      //   return MaterialPageRoute(builder: (_) => const CourseVideoView(),
      //   settings: settings);
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text("No Route defined for ${settings.name}"),
                  ),
                ));
    }
  }
}
