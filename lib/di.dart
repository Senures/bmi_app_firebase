import 'package:bmi_firebase_app/app/data/services/firebase_service.dart';
import 'package:get/get.dart';

import 'app/data/services/auth_service.dart';

class DenpendencyInjection {
  static init() async {
    await Get.putAsync(() => FirebaseService().init());
    await Get.putAsync(() => AuthService().init());
    //await Get.putAsync(() => FireStoreService().in)
    //bunuuuuuuuu ekleee
    // await Get.putAsync(() => AnalyticsService().init());
  }
}
