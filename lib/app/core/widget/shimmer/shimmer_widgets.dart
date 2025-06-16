import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShimmerWidgets {
  Widget rowShimmer({
    double leftWidth = 50.0,
    double rightWidth = 60.0,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 18,
            width: leftWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
          ),
          Container(
            height: 18,
            width: rightWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

 Widget titleShimmer({double? width}) {
    width = width ?? Get.width * .4;
    return Container(
      height: 18,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
    );
  }


}
