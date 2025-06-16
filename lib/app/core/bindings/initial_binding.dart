import 'package:get/get.dart';
import '../state/global_state.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GlobalState());
  }
}
