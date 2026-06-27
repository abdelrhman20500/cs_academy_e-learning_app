import 'package:cs_academy_e_learning_app/Core/Routing/routes.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginView:
        // return MaterialPageRoute(builder: (_) => LoginView());
      case Routes.signUpView:
        // return MaterialPageRoute(builder: (_) => const HomeView());
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
