import 'package:get/get.dart';

import 'repositories_details_controller.dart';

class RepositoriesDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RepositoriesDetailsController>(
      () => RepositoriesDetailsController(),
    );
  }
}
