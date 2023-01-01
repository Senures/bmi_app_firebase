import 'package:bmi_firebase_app/app/ui/pages/bmi_score/bmi_score.dart';
import 'package:bmi_firebase_app/app/ui/pages/home_page/home_page.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  RxInt currentIndex = 0.obs;

  changeIndex(int i) {
    currentIndex.value = i;
  }

  getBody() {
    switch (currentIndex.value) {
      case 0:
        return HomePage();
      case 1:
        return BmiScore();

      default:
    }
  }
  //
}
