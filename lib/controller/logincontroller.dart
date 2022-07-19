// ignore_for_file: unused_local_variable, non_constant_identifier_names

import 'package:blood_donation_collage/model/model_Userinformation.dart';
import 'package:blood_donation_collage/stroage/stroage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/state_manager.dart';

class LoginController extends GetxController {
  RxBool pass_view = true.obs;
  RxString wrongpassword = ''.obs;
  Stroage memory=Stroage();
  viewchange_pass() {
    print('value chenage call');
    pass_view.value = !pass_view.value;
  }

  String errors = '';
  login(UserInformation user) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: user.email!, password: user.password!);
      UserInformation.userId = userCredential.user!.uid;
      await memory.set_userlogin(UserInformation.userId );
      print('User id ' + UserInformation.userId);
    } on FirebaseAuthException catch (e) {
      errors = e.code;
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        wrongpassword.value = 'wrong-password';
        print('Wrong password provided for that user.');
      }
    }
    return errors;
  }
}
