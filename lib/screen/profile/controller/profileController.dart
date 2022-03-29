// ignore_for_file: unused_local_variable, file_names

import 'package:blood_donation_collage/helper/callingname.dart';
import 'package:blood_donation_collage/screen/registation/model/model_Userinformation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  Rx<UserInformation> userInfromation = UserInformation().obs;
  RxString dpUrl = ''.obs;
  RxString nidUrl = ''.obs;
  FirebaseStorage storage = FirebaseStorage.instance;
  RxBool dataloadsuccesfull = false.obs;

  @override
  void onInit() {
    getUserInformatio();
    getdpImage();
    super.onInit();
  }

  //**method */
  getUserInformatio() async {
    CollectionReference users =
        FirebaseFirestore.instance.collection(CallingName.user_collectionName);
    DocumentSnapshot<Object?> snapshot =
        await users.doc(UserInformation.userId).get();
    userInfromation.value.name = snapshot.get(CallingName.name);
    userInfromation.value.age = snapshot.get(CallingName.age);
    userInfromation.value.email = snapshot.get(CallingName.email);
    userInfromation.value.location = snapshot.get(CallingName.location);
    userInfromation.value.mobile = snapshot.get(CallingName.mobile);
    userInfromation.value.blood_grope = snapshot.get(CallingName.bloodgrope);
    userInfromation.value.donate_time =
        snapshot.get(CallingName.donate_time) ?? "not select";
    userInfromation.value.date = snapshot.get(CallingName.date) ?? "not select";
    userInfromation.value.request =
        snapshot.get(CallingName.request).toString();
    // print(snapshot.get(CallingName.name));
    dataloadsuccesfull.value = true;
  }

  void getdpImage() async {
    try {
      dpUrl.value = await storage
          .ref(UserInformation.userId + 'user_image')
          .getDownloadURL();
    } catch (e) {
      if ('[firebase_storage/object-not-found]' == e.toString()) {
        debugPrint('User cannot upload dp');
      }
      debugPrint('Error finding in image get method');
      debugPrint(' errors is ${e.toString()}');
    }
  }

  void getNidImage() async {
    try {
      nidUrl.value =
          await storage.ref(UserInformation.userId + 'Nid').getDownloadURL();
    } catch (e) {
      if ('[firebase_storage/object-not-found]' == e.toString()) {
        debugPrint('User cannot upload dp');
      }
      debugPrint('Error finding in image get method');
      debugPrint(' errors is ${e.toString()}');
    }
  }
}
