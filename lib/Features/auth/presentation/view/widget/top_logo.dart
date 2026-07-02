import 'package:cs_academy_e_learning_app/Core/constants/app_color.dart';
import 'package:flutter/material.dart';

class TopLogo extends StatelessWidget {
  const TopLogo({super.key, required this.text,});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        width: double.infinity,
        decoration: const BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(25))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("E_learning", style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),),
            const SizedBox(height: 10,),
            Text(text, style: const TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),),
          ],
        )
    );
  }
}
