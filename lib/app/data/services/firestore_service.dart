import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';

class FireStoreService extends GetxService {
  createUserCollection(UserCredential credential) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    await users.doc(credential.user!.uid).set(
      {
        "id": credential.user!.uid,
        "mail": credential.user!.email,
        "height": null,
        "goal": null,
        "kilo": null,
        "gender": null,
        "age": null,
      },
    );

    Get.toNamed(Routes.LOGIN);
  }
}
