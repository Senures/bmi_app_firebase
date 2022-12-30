import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/services/auth_service.dart';

class LoginController extends GetxController {
  AuthService service = AuthService();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
}
