import 'package:brain_station_assessment_task/app/core/constraints/app_constraints.dart';
import 'package:brain_station_assessment_task/app/core/widget/shimmer/shimmer_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

  Widget repoShimmer() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .2),
              blurRadius: 6,
              offset: Offset(0, 2),
            )
          ]),
      padding: mainPadding(12, 12),
      margin: mainPadding(16, 12),
      child: ShimmerBase(
        child: Row(
          children: [
            Container(
              width: 0.15.sw,
              height: 0.15.sw,
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            ),
            gapW8,
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    titleShimmer(),
                    gapH6,
                    titleShimmer(),
                    gapH6,
                    titleShimmer(),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
