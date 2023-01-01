import 'package:bmi_firebase_app/app/controllers/base_controller.dart';
import 'package:get/get.dart';

class BaseBinding implements Bindings {
  @override
  Future<void> dependencies() async {
    Get.lazyPut<BaseController>(() => BaseController());
  }
}
