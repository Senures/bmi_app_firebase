import 'package:get/get.dart';
import '../controllers/user_info_controller.dart';

class UserInfoBinding implements Bindings {
  @override
  Future<void> dependencies() async {
    Get.lazyPut<UserInfoController>(() => UserInfoController());
  }
}
