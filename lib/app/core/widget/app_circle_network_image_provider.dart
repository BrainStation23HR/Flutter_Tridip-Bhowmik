import 'package:brain_station_assessment_task/app/core/widget/shimmer/shimmer_base.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constraints/app_colors.dart';
import '../utils/helper/app_helper.dart';
import 'image_viewer.dart';

class AppCircleNetworkImageViewer extends StatelessWidget {
  final String? imagePath;
  final double? width, padding, radius;
  final bool isProfile, needToShowImageView;

  const AppCircleNetworkImageViewer(
    this.imagePath,
    this.width,
    this.radius, {
    super.key,
    this.padding = 8,
    this.isProfile = false,
    this.needToShowImageView = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: needToShowImageView
          ? () {
              if ((imagePath ?? "") != "") {
                Get.to(
                  ImageDetailScreen(
                    image: imagePath ?? "",
                    tag: '',
                  ),
                );
              }
            }
          : null,
      child: CircleAvatar(
        radius: radius?.r,
        backgroundColor: Colors.white,
        child: ClipOval(
          child: CachedNetworkImage(
            imageUrl: imagePath ?? "",
            height: width,
            width: width,
            fit: BoxFit.cover,
            /*placeholder: 'assets/placeholder_profile_pic.jpg',*/
            progressIndicatorBuilder: (
              context,
              child,
              loadingProgress,
            ) {
              return ShimmerBase(
                child: Container(
                  height: width,
                  width: width,
                  color: AppColors.grey,
                ),
              );
            },
            errorWidget: (
              BuildContext context,
              String url,
              dynamic error,
            ) {
              return Container(
                height: width,
                width: width,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    isProfile
                        ? "assets/png/empty_profile.png"
                        : "assets/png/no_image.png",
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
