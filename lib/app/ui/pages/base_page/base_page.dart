import 'package:bmi_firebase_app/app/bindings/home_binding.dart';
import 'package:bmi_firebase_app/app/controllers/base_controller.dart';
import 'package:bmi_firebase_app/app/controllers/bmi_score_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/home_controller.dart';

class BasePage extends GetView<BaseController> {
  BasePage({super.key});

  var homeCtrl = Get.lazyPut(() => HomeController());
  var bmiCtrl = Get.lazyPut(() => BmiScoreController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: controller.getBody(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: (value) {
            controller.changeIndex(value);
          },
          items: const [
            BottomNavigationBarItem(
              label: "Haftalık",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "BMI Score",
              icon: Icon(Icons.home),
            ),
          ],
        ),
      );
    });
  }
}
