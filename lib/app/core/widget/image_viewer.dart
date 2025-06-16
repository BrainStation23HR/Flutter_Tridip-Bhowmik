import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_network_image.dart';

class ImageDetailScreen extends StatelessWidget {
  final String image;
  final String tag;

  const ImageDetailScreen({super.key, required this.image, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppAppbar(title: "Image"),
      body: Center(
        child: Hero(
          tag: tag,
          child: AppNetworkImageProvider(
            image,
            double.maxFinite,
            Get.height * .6,
            height: 0,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
