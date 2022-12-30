import 'package:bmi_firebase_app/app/bindings/login_binding.dart';
import 'package:bmi_firebase_app/di.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

User? auth = FirebaseAuth.instance.currentUser;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Pref.init();
  await DenpendencyInjection.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.LOGIN,
      //home: const LoginView(),
      //EĞER GET PAGES VE İNİTİAL ROUTE VARSA HOMEU KAPA,YOKSSA İNİTİAL BİNDİNG AÇ

      getPages: AppPages.routes,

      // initialBinding: LoginBinding(),
      //routes: MyApp,
      //initialBinding: LoginBinding()
      //  home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
