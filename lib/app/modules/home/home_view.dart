import 'package:brain_station_assessment_task/app/core/constraints/app_colors.dart';
import 'package:brain_station_assessment_task/app/core/constraints/app_constraints.dart';
import 'package:brain_station_assessment_task/app/core/constraints/app_text_style.dart';
import 'package:brain_station_assessment_task/app/core/widget/shimmer/shimmer_widgets.dart';
import 'package:brain_station_assessment_task/app/data/api_response_model/flutter_repo_response_model.dart';
import 'package:brain_station_assessment_task/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Flutter Repositories",
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: controller.scrollController,
          child: Column(
            children: [
              Obx(() {
                if (!controller.isDataLoaded.value) {
                  return Center(child: ShimmerWidgets().repoShimmer());
                }
                if (controller.flutterRepoList.isEmpty) {
                  return Center(child: Text("No Data Found"));
                }
                return ListView.separated(
                  shrinkWrap: true,
                  padding: mainPadding(16, 12),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.flutterRepoList.length,
                  itemBuilder: (context, index) {
                    var repoData = controller.flutterRepoList[index];
                    return repositoriesCard(repoData);
                  },
                  separatorBuilder: (context, index) {
                    return gapH12;
                  },
                );
              })
            ],
          ),
        ),
      ),
    );
  }

  repositoriesCard(Item repoData) {
    return Material(
      color: Colors.white,
      elevation: 1,
      shadowColor: Colors.black,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: () {
          Get.toNamed(Routes.REPOSITORIES_DETAILS, arguments: repoData);
        },
        child: Padding(
          padding: mainPadding(12, 12),
          child: Row(
            children: [
              Container(
                width: 0.15.sw,
                height: 0.15.sw,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withValues(alpha: .1),
                  shape: BoxShape.circle,
                ),
                padding: mainPadding(8, 8),
                child: FlutterLogo(),
              ),
              gapW12,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            repoData.name ?? "",
                            style: text18Style(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
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
                                size: 16,
                                color: Colors.orange,
                              ),
                              gapW3,
                              Text(
                                "${repoData.stargazersCount ?? ""}",
                                style: text12Style(color: Colors.orange),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    gapH3,
                    Text(
                      repoData.owner?.login ?? "",
                      style: text14Style(),
                    ),
                    gapH3,
                    Text(
                      repoData.description ?? "",
                      style: text12Style(color: AppColors.textGrey700),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    gapH3,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Last Updated At: ",
                          style: text12Style(),
                        ),
                        Flexible(
                          child: Text(
                            (repoData.updatedAt ?? "") != ""
                                ? DateFormat('dd MMM yyyy').format(
                                    DateTime.parse(repoData.updatedAt ?? ""))
                                : "",
                            style: text12Style(color: AppColors.textGrey700),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
