import 'dart:developer';

import 'package:bmi_firebase_app/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../data/services/auth_service.dart';

class HomeController extends GetxController {
  RxBool isLoading = false.obs;

  List<BMImodel> modelData = <BMImodel>[].obs;
  UserModel? userModel;

  final date = DateTime.parse(DateFormat('y-MM-dd').format(DateTime.now()));

  DateTime getDate(DateTime d) => DateTime(d.year, d.month, d.day);

  @override
  void onInit() {
    getAsyncData();
    super.onInit();
  }

  getAsyncData() async {
    isLoading.value = true;
    await getData();

    await getUser();
  }

  Future getUser() async {
    var data = await FirebaseFirestore.instance
        .collection("users")
        .doc(auth!.uid)
        .get();

    userModel = UserModel(
      age: data.data()!["age"],
      gender: data.data()!["gender"],
      goal: data.data()!["goal"],
      height: data.data()!["height"],
      kilo: data.data()!["kilo"],
    );

    isLoading.value = false;
  }

  Future getData() async {
    modelData.clear();
    isLoading.value = true;
    print(date);
    DateTime startDate = getDate(date.subtract(Duration(days: date.weekday)));
    DateTime endDate =
        getDate(date.add(Duration(days: DateTime.daysPerWeek - date.weekday)));

    print("=== " + startDate.toString());
    print("=== " + endDate.toString());

    for (var i = 1; i <= 7; i++) {
      modelData.add(BMImodel(id: startDate.add(Duration(days: i))));
    }
    log("111");

    var data = await FirebaseFirestore.instance
        .collection("users")
        .doc(auth!.uid)
        .collection("userBMI")
        .where("id", isGreaterThanOrEqualTo: startDate.toString())
        .where("id", isLessThanOrEqualTo: endDate.toString())
        .orderBy("id", descending: false)
        .get();

    for (var element in data.docs) {
      for (var e in modelData) {
        if (e.id == DateTime.parse(element.id)) {
          log("EŞLEŞTİ");
          e.bmiScore = element.data()["score"].toString();
          e.height = element.data()["height"].toString();
          e.kilo = element.data()["kilo"].toString();
        }
      }
    }
  }
}

class BMImodel {
  DateTime? id;
  String? height;
  String? kilo;
  String? bmiScore;

  BMImodel({this.kilo, this.height, this.bmiScore, this.id});
}

class UserModel {
  String? age;
  String? gender;
  String? height;
  String? goal;
  String? kilo;

  UserModel({this.age, this.gender, this.goal, this.height, this.kilo});
}
