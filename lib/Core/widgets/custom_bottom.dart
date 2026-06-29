import 'package:flutter/material.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom({super.key, this.onPressed, required this.text, this.width,this.backgroundColor, this.borderRadius});

  final void Function()? onPressed;
  final String text;
  final Color? backgroundColor;
  final double? width;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: width,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor ?? Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: borderRadius ?? BorderRadius.zero
              )
          ),
          onPressed: onPressed, child: Text(text,style: const TextStyle(
          fontSize: 20,fontWeight: FontWeight.bold, color: Colors.white),)),
    );
  }
}
