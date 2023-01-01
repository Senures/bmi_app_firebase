import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/services/auth_service.dart';

class LoginController extends GetxController {
  AuthService service = AuthService();
  //get find ilede service inject edebilirdik
  
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  void dispose() {
    emailcontroller.clear();
    passwordcontroller.clear();
    super.dispose();
  }
}
