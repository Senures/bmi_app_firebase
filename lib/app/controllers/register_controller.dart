import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/services/auth_service.dart';
import '../data/services/firestore_service.dart';

class RegisterController extends GetxController {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  AuthService service = AuthService();
  FireStoreService fireStoreService = FireStoreService();
  RxBool isShow = true.obs;
  RxBool isCorrect = false.obs;

  String? userType;
  String? userRole;

  showPassword() {
    isShow.value = !isShow.value;
  }

  @override
  void dispose() {
    emailcontroller.clear();
    passwordcontroller.clear();
    super.dispose();
  }
}
