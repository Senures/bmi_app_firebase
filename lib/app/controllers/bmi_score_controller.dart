import 'dart:developer';

import 'package:bmi_firebase_app/app/ui/pages/home_page/home_page.dart';
import 'package:bmi_firebase_app/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'home_controller.dart';

class BmiScoreController extends GetxController {
  String tt = "denem";

  RxBool isLoading = false.obs;
  @override
  void onInit() {
    getData(true);
    super.onInit();
  }

  BMImodel? bmImodel;

  DateTime date = DateTime.now();

  Rx<DateTime?> onlyDate = DateTime.now().obs;

  upDate() {
    onlyDate.value = onlyDate.value!.add(const Duration(days: 1));

    getData(false);
  }

  downDate() {
    onlyDate.value = onlyDate.value!.add(const Duration(days: -1));

    getData(false);
  }

  getData(bool isFirst) async {
    isLoading.value = true;
    if (isFirst) {
      onlyDate.value = DateTime(date.year, date.month, date.day);
    }

    var data = await FirebaseFirestore.instance
        .collection("users")
        .doc(auth!.uid)
        .collection("userBMI")
        .doc(DateFormat("y-MM-dd").format(onlyDate.value!))
        .get();

    bmImodel = BMImodel(
      id: DateTime.parse(data.id),
      bmiScore: data.data() == null ? "0.0" : data.data()!["score"].toString(),
      height: data.data() == null ? "0.0" : data.data()!["height"].toString(),
      kilo: data.data() == null ? "0.0" : data.data()!["kilo"].toString(),
    );

    isLoading.value = false;
  }
}
