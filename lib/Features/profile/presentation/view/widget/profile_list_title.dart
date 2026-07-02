import 'package:cs_academy_e_learning_app/Core/constants/app_color.dart';
import 'package:flutter/material.dart';

class ProfileListTitle extends StatelessWidget {
  ProfileListTitle({super.key, required this.text1, required this.text2, required this.icon,this.onTap});

  final String text1;
  final String text2;
  final IconData icon;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(color: Colors.deepPurple[50], shape: BoxShape.circle),
        child: Icon(icon, color: AppColors.primaryColor, size: 25),
      ),
      title: Text(text1, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
      subtitle: Text(text2, style: const TextStyle(fontSize: 15)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 14, color:AppColors.primaryColor),
      onTap: onTap,
    );
  }
}