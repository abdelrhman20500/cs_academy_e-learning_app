import 'package:flutter/material.dart';

class ProfileListTitle extends StatelessWidget {
  const ProfileListTitle({super.key, required this.text1, required this.text2, required this.icon,});

  final String text1;
  final String text2;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(color: Colors.deepPurple[50], shape: BoxShape.circle),
        child: Icon(icon, color: Colors.deepPurple, size: 25),
      ),
      title: Text(text1, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
      subtitle: Text(text2, style: const TextStyle(fontSize: 15)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.black),
      onTap: () {},
    );
  }
}