import 'package:cs_academy_e_learning_app/Core/Utilis/simple_bloc_observer.dart';
import 'package:cs_academy_e_learning_app/Core/networking/supabase_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Core/Routing/app_route.dart';
import 'Core/Routing/routes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseService.init();
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E_learning App',
      onGenerateRoute: AppRouter().generateRoute,
      initialRoute: Routes.signUpView,
    );
  }
}

