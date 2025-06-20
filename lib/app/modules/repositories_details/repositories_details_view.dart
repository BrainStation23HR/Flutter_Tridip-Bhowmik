import 'package:brain_station_assessment_task/app/core/constraints/app_colors.dart';
import 'package:brain_station_assessment_task/app/core/constraints/app_constraints.dart';
import 'package:brain_station_assessment_task/app/core/constraints/app_text_style.dart';
import 'package:brain_station_assessment_task/app/core/widget/app_app_bar.dart';
import 'package:brain_station_assessment_task/app/core/widget/app_circle_network_image_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'repositories_details_controller.dart';

class RepositoriesDetailsView extends GetView<RepositoriesDetailsController> {
  const RepositoriesDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    var details = controller.repoDetails;
    return Scaffold(
      appBar: AppAppbar(title: "Details"),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: mainPadding(16, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 0.2.sh,
                width: double.maxFinite,
                child: FlutterLogo(),
              ),
              gapH12,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      details.name ?? "",
                      style: text18Style(),
                    ),
                  ),
                  gapW8,
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.orange.withValues(alpha: .1),
                        borderRadius: BorderRadius.circular(30)),
                    padding: mainPadding(8, 4),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 18.r,
                          color: Colors.orange,
                        ),
                        gapW3,
                        Text(
                          "${details.stargazersCount ?? ""}",
                          style: text14Style(color: Colors.orange),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              gapH8,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Last Updated At: ",
                    style: text14Style(),
                  ),
                  Flexible(
                    child: Text(
                      (details.updatedAt ?? "") != ""
                          ? DateFormat('dd MMM yyyy')
                              .format(DateTime.parse(details.updatedAt ?? ""))
                          : "",
                      style: text12Style(),
                    ),
                  ),
                ],
              ),
              gapH8,
              appWidget.divider(thickness: 1),
              Row(
                children: [
                  AppCircleNetworkImageViewer(details.owner?.avatarUrl, 50, 28),
                  gapW8,
                  Text(
                    details.owner?.login ?? "",
                    style: text14Style(color: AppColors.textGrey700),
                  ),
                ],
              ),
              appWidget.divider(thickness: 1),
              gapH6,
              Text(
                "Description: ",
                style: text16Style(),
              ),
              gapH3,
              Text(
                details.description ?? "",
                style: text14Style(color: AppColors.lightTextGrey),
              ),
              gapH12,
            ],
          ),
        ),
      ),
    );
  }
}
