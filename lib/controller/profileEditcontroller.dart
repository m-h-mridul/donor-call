// ignore_for_file: non_constant_identifier_names, file_names, unused_catch_clause

import 'dart:io';

import 'package:blood_donation_collage/helper/callingname.dart';
import 'package:blood_donation_collage/model/model_Userinformation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProfileEditContoller extends GetxController {
  RxString imagefilename = ''.obs;
  FirebaseStorage storage = FirebaseStorage.instance;

  ///**meyhod get image*/
  imageGetGellery() async {
    try {
      XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        imagefilename.value = image.path;
      }
    } catch (e) {
      // print('Errorr find in photo get api ${e.toString()}');
    }
  }

  //**sent image into firabse stroage */
  image_sentFirebase(String uid) async {
    // Uploading the selected image with some custom meta data
    try {
      await storage.ref(uid + 'user_image').putFile(File(imagefilename.value));
    } on FirebaseException catch (error) {
      // print(error);
    } catch (err) {
      // print(err);
    }
  }

  //**edit information sent api */
  UpdatedataIn_firebase(UserInformation userInfo) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(UserInformation.userId)
        .update({
      CallingName.name: userInfo.name,
      CallingName.email: userInfo.email,
      CallingName.bloodgrope: userInfo.blood_grope!.toUpperCase(),
      CallingName.location: userInfo.location,
      CallingName.age: userInfo.age,
      CallingName.mobile: userInfo.mobile,
      CallingName.date: userInfo.date,
      CallingName.donate_time: userInfo.donate_time,
    });
  }
}
