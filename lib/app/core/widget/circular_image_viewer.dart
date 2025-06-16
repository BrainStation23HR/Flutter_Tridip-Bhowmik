import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constraints/app_colors.dart';
import '../utils/helper/app_helper.dart';

class CircularImageViewer extends StatelessWidget {
  final double circleRadius, borderWidth, circleRoundRadius;
  final String imageUrl;
  final Color backgroundColor, borderColor;
  final bool isProfile, needToShowImageView;

  const CircularImageViewer({
    super.key,
    required this.imageUrl,
    this.circleRadius = 150.0,
    this.borderWidth = 0,
    this.backgroundColor = AppColors.likeWhite,
    this.borderColor = AppColors.black,
    this.circleRoundRadius = 200,
    this.isProfile = true,
    this.needToShowImageView = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(circleRoundRadius),
        border: Border.all(
          width: borderWidth,
          color: borderColor,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(circleRoundRadius),
        child: CachedNetworkImage(
          fadeInDuration: const Duration(microseconds: 500),
          height: circleRadius,
          width: circleRadius,
          fit: BoxFit.cover,
          imageUrl: AppHelper().validateImageURL(imageUrl),
          placeholder: (context, url) {
            return const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator.adaptive(
                    backgroundColor: Colors.white,
                  ),
                ),
              ],
            );
          },
          errorWidget: (context, url, error) {
            return Container(
              color: backgroundColor,
              child: Image.asset(
                isProfile
                    ? "assets/png/no_image.png"
                    : "assets/png/no_image.png",
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ),
    );
  }
}
