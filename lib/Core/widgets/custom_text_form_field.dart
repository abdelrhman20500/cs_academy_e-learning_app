import 'package:cs_academy_e_learning_app/Core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.hintText, this.keyboardType,
    this.suffixIcon,this.controller, this.prefixIcon,});

  final String hintText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      validator: (value){
        if(value == null || value.isEmpty){
          return "This Field is Required";
        }else{
          return null;
        }
      },
      decoration: InputDecoration(
        fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          hintText: hintText,
          hintStyle: AppTheme.textStyle18,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
      ),
    );
  }
}
