import 'package:cached_network_image/cached_network_image.dart';
import 'package:cs_academy_e_learning_app/Core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../Core/widgets/custom_bottom.dart';

class MyCoursesCard extends StatelessWidget {
  const MyCoursesCard({super.key, required this.imageUrl, required this.title,});
  final String imageUrl;
  final String title;
  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    var width= MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.fill,
                height: height * 0.16, // Adjust height
                width:width*0.4, // Full width
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey[700]!,
                  highlightColor: Colors.grey[500]!,
                  child: Container(
                    height: height * 0.22,
                    width: double.infinity,
                    color: Colors.grey,
                  ),
                ),
                errorWidget: (context, url, error) =>
                const Icon(Icons.error),
              ),
            ),
            Column(
              children: [
                Text(title, style: AppTheme.textStyle20,),
                SizedBox(height: height*0.02,),
                CustomBottom(text: "Complete Course",
                  borderRadius: BorderRadius.circular(16), backgroundColor: Colors.deepPurple,
                  onPressed: (){},)
              ],
            )
          ],
        ),
      ),
    );
  }
}
