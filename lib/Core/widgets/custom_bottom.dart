import 'package:flutter/material.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom({super.key, this.onPressed, required this.text, this.width,});

  final void Function()? onPressed;
  final String text;
  // final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: width,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero
              )
          ),
          onPressed: onPressed, child: Text(text,style: const TextStyle(
          fontSize: 20,fontWeight: FontWeight.bold, color: Colors.white),)),
    );
  }
}
