// ignore_for_file: camel_case_types, unused_local_variable, non_constant_identifier_names

import 'dart:io';

import 'package:blood_donation_collage/helper/callingname.dart';
import 'package:blood_donation_collage/helper/validation.dart';
import 'package:blood_donation_collage/model/model_Userinformation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Registation_controller extends GetxController {
  String errors = '';
  RxString imagefilename = ''.obs;
  FirebaseStorage storage = FirebaseStorage.instance;

  register_User(UserInformation userInfo) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: userInfo.email!, password: userInfo.password!);
      UserInformation.userId = userCredential.user!.uid;
      await FirebaseFirestore.instance
          .collection('users')
          .doc(UserInformation.userId)
          .set({
        CallingName.user_id: UserInformation.userId,
        CallingName.name: userInfo.name,
        CallingName.email: userInfo.email,
        CallingName.bloodgrope: userInfo.blood_grope!.toUpperCase(),
        CallingName.location: userInfo.location,
        CallingName.age: userInfo.age,
        CallingName.donate_time: userInfo.donate_time,
        CallingName.mobile: userInfo.mobile,
        CallingName.request: 0,
        CallingName.date: userInfo.date
      });
      //**\
      //**blood grope doner data sent  */
      // */
      await FirebaseFirestore.instance
          .collection(CallingName.bloodgrope)
          .doc(userInfo.blood_grope!.toUpperCase())
          .update({CallingName.bloodgrope: FieldValue.increment(1)});
    } on FirebaseAuthException catch (e) {
      errors = e.code;
      Validation.emailvalidation(errors);
      Validation.passwordvalidation(errors);
      // if (e.code == 'weak-password') {
      //   print('The password provided is too weak.');
      // } else if (e.code == 'email-already-in-use') {
      //   print('The account already exists for that email.');
      // }
    } catch (e) {
      // print('Error find in login controller \n' + e.toString());
    }
    return errors;
  }

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
}
