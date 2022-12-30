import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/services/auth_service.dart';
import '../data/services/firestore_service.dart';

class RegisterController extends GetxController {
  TextEditingController emailcontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController referancecontroller = TextEditingController();
  AuthService service = AuthService();
  FireStoreService fireStoreService = FireStoreService();
  RxBool isShow = true.obs;
  RxBool isCorrect = false.obs;

  String? userType;
  String? userRole;

  showPassword() {
    isShow.value = !isShow.value;
  }

  userRoles() async {
    if (referancecontroller.text == "editor") {
      userType = referancecontroller.text;
      isCorrect.value = true;
    } else {
      isCorrect.value = false;
      userType = null;
      referancecontroller.clear();
      Get.snackbar("HATA", 'Geçersiz referans kodu.',
          snackPosition: SnackPosition.BOTTOM, colorText: Colors.white);
    }
    update();
  }
}
