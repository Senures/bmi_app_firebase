import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  Future<void> dependencies() async {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
