import 'package:cached_network_image/cached_network_image.dart';
import 'package:cs_academy_e_learning_app/Core/constants/app_color.dart';
import 'package:cs_academy_e_learning_app/Core/widgets/custom_bottom.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../Core/Routing/routes.dart';


class CoursesCard extends StatelessWidget {
  const CoursesCard({super.key, required this.title, required this.id, required this.imageUrl, required this.description, required this.price,});

  final String title;
  final String id;
  final String imageUrl;
  final String description;
  final num price;

  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.fill,
                height: height * 0.2, // Adjust height
                width: double.infinity, // Full width
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
            SizedBox(height: height*0.012,),
            Text(title,
              style: const TextStyle(fontSize: 22,color: Colors.black, fontWeight: FontWeight.bold),
              maxLines: 1, overflow: TextOverflow.ellipsis,),
            SizedBox(height: height*0.012,),
            Text("${price.toString()} EGP",
                style: const TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w600)),
            SizedBox(height:height * 0.012),
            CustomBottom(text: "Show Details", onPressed: ()
            {
              Navigator.pushNamed(context, Routes.courseDetailsView,
                arguments: {
                  "id": id,
                  "title": title,
                  "imageUrl": imageUrl,
                  "description": description,
                  "price": price,
                },
              );
            },borderRadius: BorderRadius.circular(16.0),backgroundColor: AppColors.primaryColor,)
          ],
        ),
      ),
    );
  }
}