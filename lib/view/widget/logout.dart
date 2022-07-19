// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:blood_donation_collage/clean%20appstroage/cleanStroage.dart';
import 'package:blood_donation_collage/controller/doner_requestcontroller.dart';
import 'package:blood_donation_collage/resource/Textstyle.dart';
import 'package:blood_donation_collage/controller/Donerrequest_controller.dart';
import 'package:blood_donation_collage/controller/Dashboard_controller.dart';
import 'package:blood_donation_collage/view/screen/home.dart';
import 'package:blood_donation_collage/controller/profileController.dart';
import 'package:blood_donation_collage/stroage/stroage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

Stroage memory=Stroage();
Logout(BuildContext context) {
  // set up the button
  Widget C_Button = TextButton(
    child: Text("Cancel"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget L_Button = TextButton(
    child: Text("Logout"),
    onPressed: () async {
      // make flase user that he/she are off line
      // signout from firebase
      await FirebaseAuth.instance.signOut();
      await deleteCacheDir();
      Get.delete<ProfileController>();
      Get.delete<DonerRequestController>();
      Get.delete<DashboardController>();
      Get.deleteAll();
      memory.cleanstroage();
      // goto the app home screen
      Get.offAllNamed(Home.name);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title:  Text("Logout!",style: Textstyle.black16,),
    content: const Text("You want to Logout ...."),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(18.0))),
    actions: [C_Button, L_Button],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
