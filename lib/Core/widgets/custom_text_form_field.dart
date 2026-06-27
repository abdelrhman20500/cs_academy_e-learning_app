import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.hintText, this.keyboardType,
    this.suffixIcon,this.controller,});

  final String hintText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      validator: (value){
        if(value == null || value.isEmpty){
          return "This Field Required";
        }else{
          return null;
        }
      },
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: hintText,
          suffixIcon: suffixIcon
      ),
    );
  }
}
