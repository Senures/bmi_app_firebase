import 'package:bmi_firebase_app/app/data/services/firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';

class AuthService extends GetxService {
  late UserCredential credential;

  Future<AuthService> init() async {
    //createUser();

    return this;
  }

  createUser(String email, String password, String? role) async {
    FireStoreService fireStoreService = FireStoreService();
    try {
      credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user != null) {
        fireStoreService.createUserCollection(credential);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        Get.snackbar("PLEASE", 'The password provided is too weak.',
            snackPosition: SnackPosition.BOTTOM, colorText: Colors.white);
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        Get.snackbar("PLEASE", 'The account already exists for that email.',
            snackPosition: SnackPosition.BOTTOM, colorText: Colors.white);
      }
    } catch (e) {
      print(e);
    }
  }

  account(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
        var data = await FirebaseFirestore.instance
            .collection("users")
            .doc(credential.user!.uid)
            .get();

        if (data.data()?["goal"] == null) {
          Get.offAndToNamed(Routes.USER_INFO);
        } else {
          Get.offAndToNamed(Routes.BASE);
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        Get.snackbar("ERROR", 'No user found for that email.',
            snackPosition: SnackPosition.BOTTOM, colorText: Colors.white);
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        Get.snackbar("ERROR", 'Wrong password provided for that user.',
            snackPosition: SnackPosition.BOTTOM, colorText: Colors.white);
      }
    }
  }
}
