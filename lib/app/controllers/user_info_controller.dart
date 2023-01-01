import 'dart:math';

import 'package:bmi_firebase_app/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../routes/app_pages.dart';

class UserInfoController extends GetxController {
  Rx<GenderEnum>? genderEnum = GenderEnum.male.obs;

  final formKey = GlobalKey<FormState>();

  TextEditingController heightCtrl = TextEditingController();
  TextEditingController kiloCtrl = TextEditingController();
  TextEditingController goalCtrl = TextEditingController();
  TextEditingController ageCtrl = TextEditingController();

  RxBool isLoading = false.obs;

  setGender({required GenderEnum gender}) {
    switch (gender) {
      case GenderEnum.male:
        genderEnum!.value = GenderEnum.male;
        break;
      case GenderEnum.female:
        genderEnum!.value = GenderEnum.female;
        break;
    }
  }

  saveData() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;

      double bmi =
          int.parse(kiloCtrl.text) / pow((int.parse(heightCtrl.text) / 100), 2);

      await FirebaseFirestore.instance
          .collection("users")
          .doc(auth!.uid)
          .collection("userBMI")
          .doc(DateFormat('y-MM-dd').format(DateTime.now()).toString())
          .set(
        {
          "height": heightCtrl.text,
          "kilo": kiloCtrl.text,
          "score": bmi,
          "id": DateFormat('y-MM-dd').format(DateTime.now()).toString(),
        },
      );

      await FirebaseFirestore.instance
          .collection("users")
          .doc(auth!.uid)
          .update(
        {
          "height": heightCtrl.text,
          "kilo": kiloCtrl.text,
          "goal": goalCtrl.text,
          "age": ageCtrl.text,
          "gender": genderEnum!.value.code,
        },
      );

      isLoading.value = false;
      Get.offAndToNamed(Routes.BASE);
    }
  }
}

enum GenderEnum {
  male(name: "Male", code: "male"),
  female(name: "Female", code: "female");

  const GenderEnum({required this.name, required this.code});

  final String name;
  final String code;
}
