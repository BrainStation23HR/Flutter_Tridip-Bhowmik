import 'package:brain_station_assessment_task/app/core/constraints/app_constraints.dart';
import 'package:brain_station_assessment_task/app/network/api_urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/api_response_model/flutter_repo_response_model.dart';

class HomeController extends GetxController {
  final scrollController = ScrollController();
  final flutterRepoList = <Item>[].obs;
  final isDataLoaded = false.obs;
  int pageNo = 1, maxPageSize = 1;

  @override
  void onInit() {
    fetchFlutterRepositoriesListData();
    scrollController.addListener(() {
      if (scrollController.hasClients) {
        if (scrollController.position.maxScrollExtent ==
            scrollController.offset) {
          if (pageNo < maxPageSize) {
            pageNo += 1;
            fetchFlutterRepositoriesListData(needLoader: true);
          }
        }
      }
    });
    super.onInit();
  }

  void fetchFlutterRepositoriesListData({bool needLoader=false}) async {
    var queryParam = <String, dynamic>{};
    queryParam['q'] = 'flutter+language:Dart';
    queryParam['sort'] = 'stars';
    queryParam['page '] = pageNo;
    queryParam['per_page'] = '10';
    var response = await apiClient.getAPI(
      repositoriesUrl,
      fetchFlutterRepositoriesListData,
      mQueryParameters: queryParam,
      needLoader: needLoader
    );
    if (response != null) {
      var model = flutterRepoResponseModelFromJson(response.toString());

      List<Item> temp = [];

      for (var item in (model.items ?? [])) {
        temp.add(item);
      }
      flutterRepoList.addAll(temp);
      isDataLoaded.value = true;
      if (pageNo == 1) {
        maxPageSize = ((model.totalCount ?? 0) / 10).ceil();
      }
    } else {
      isDataLoaded.value = true;
      flutterRepoList.clear();
    }
  }
}
