import 'dart:developer';

import 'package:bmi_firebase_app/di.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

// User? auth = FirebaseAuth.instance.currentUser;

User? auth;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DenpendencyInjection.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff232F3C),
          centerTitle: true,
          elevation: 0,
        ),
        scaffoldBackgroundColor: const Color(0xff232F3C),
        primarySwatch: Colors.blue,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
        ),
      ),
      initialRoute: Routes.SPLASH,
      getPages: AppPages.routes,
    );
  }
}

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    listenUser();
    getDelay();
    super.initState();
  }

  getDelay() async {
    await Future.delayed(const Duration(seconds: 2));
    await checkUser();
  }

  listenUser() {
    FirebaseAuth.instance.authStateChanges().listen((event) {
      log("---- LİSTING USER ----");

      if (auth == null) {
        auth?.reload();
        log("USER RELOAD EDİLDİ");
      }

      auth = event;
    });
  }

  checkUser() async {
    if (auth != null || auth?.uid != null) {
      var data = await FirebaseFirestore.instance
          .collection("users")
          .doc(auth!.uid)
          .get();

      if (data.data()?["height"] == null || data.data()?["height"] == "") {
        Get.offAndToNamed(Routes.USER_INFO);
      } else {
        Get.offAndToNamed(Routes.BASE);
      }
    } else {
      Get.offAndToNamed(Routes.LOGIN);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text("Splash"),
      ),
    );
  }
}
