import 'package:get/get.dart';

import '../../data/api_response_model/flutter_repo_response_model.dart';

class RepositoriesDetailsController extends GetxController {
  var repoDetails = Item();

  @override
  void onInit() {
    if (Get.arguments != null) {
      repoDetails = Get.arguments;
    }
    super.onInit();
  }
}
