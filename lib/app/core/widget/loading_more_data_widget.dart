import 'package:flutter/material.dart';

import '../constraints/app_colors.dart';
import '../constraints/app_constraints.dart';
import '../constraints/app_text_style.dart';


class LoadingMoreDataWidget extends StatelessWidget {
  final bool hasMore, needMoreSpace;

  const LoadingMoreDataWidget(
      {super.key, required this.hasMore, this.needMoreSpace = true});

  @override
  Widget build(BuildContext context) {
    return hasMore == true
        ? Column(
            children: [
              const CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
              gapH12,
              Text(
                "Loading more data....",
                style: text16Style(isWeight600: true, isPrimaryColor: true),
              ),
              Visibility(
                visible: needMoreSpace,
                child: gapH48,
              ),
              gapH20,
            ],
          )
        : Container();
  }
}
