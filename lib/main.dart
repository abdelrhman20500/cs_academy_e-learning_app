import 'package:cs_academy_e_learning_app/Core/networking/supabase_service.dart';
import 'package:cs_academy_e_learning_app/Features/layout/presentation/view/layout_view.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E_learning App',
      home: LayoutView(),
    );
  }
}

