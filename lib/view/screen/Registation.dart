// ignore_for_file: prefer_const_constructors, must_be_immutable, non_constant_identifier_names, unused_local_variable, file_names

import 'dart:io';

import 'package:blood_donation_collage/resource/Textstyle.dart';
import 'package:blood_donation_collage/resource/appcolor.dart';
import 'package:blood_donation_collage/resource/media_query.dart';
import 'package:blood_donation_collage/helper/validation.dart';
import 'package:blood_donation_collage/controller/registation_controller.dart';
import 'package:blood_donation_collage/model/bloodmodel.dart';
import 'package:blood_donation_collage/model/model_Userinformation.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'Dashboard.dart';

class Registation extends StatelessWidget {
  Registation({Key? key}) : super(key: key);
  static const name = 'registation';
  //**
  //**variable */
  // */
  Registation_controller registation_controller =
      Get.put(Registation_controller());
  RxString bloodgropeselected = 'AB+'.obs;
// **
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController donate_time = TextEditingController();
  TextEditingController blood_grope = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController date2 = TextEditingController(
    text: DateTime.now().toString(),
  );
  RxBool view = true.obs;
  final fromkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: ProgressHUD(
      child: Builder(builder: (context) {
        return SingleChildScrollView(
          child: Form(
            key: fromkey,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuerypage.safeBlockHorizontal! * 4,
                  vertical: MediaQuerypage.safeBlockVertical! * 1),
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuerypage.safeBlockVertical! * 2),
                    child: InkWell(
                      onTap: () async {
                        registation_controller.imageGetGellery();
                      },
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(MediaQuerypage.pixel! * 45),
                        child: Obx(
                          () => registation_controller.imagefilename.value != ''
                              ? Image.file(
                                  File(registation_controller
                                      .imagefilename.value),
                                  width: MediaQuerypage.screenWidth! * 0.45,
                                  height: MediaQuerypage.screenHeight! * 0.22,
                                  fit: BoxFit.fill,
                                )
                              : Image(
                                  width: MediaQuerypage.screenWidth! * 0.45,
                                  height: MediaQuerypage.screenHeight! * 0.22,
                                  fit: BoxFit.fill,
                                  image: const AssetImage(
                                    'assets/user.png',
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ),

                  TextFormField(
                    controller: username,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    textCapitalization: TextCapitalization.words,
                    validator: (_) {
                      if (username.text.toString().isEmpty) {
                        return 'Enter Name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius:
                              BorderRadius.circular(MediaQuerypage.pixel! * 6),
                        ),
                        filled: true,
                        fillColor: AppColor.grey_textFiled,
                        prefixIcon: Icon(
                          Icons.perm_identity,
                          color: AppColor.red_appcolor,
                        ),
                        hintText: 'Name'),
                  ),

                  //**email */
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuerypage.safeBlockVertical! * 2),
                    child: TextFormField(
                      controller: email,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.words,
                      validator: (_) {
                        Validation.emailvalidation(email.text.toString());
                        return null;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(
                                MediaQuerypage.pixel! * 6),
                          ),
                          filled: true,
                          fillColor: AppColor.grey_textFiled,
                          prefixIcon: Icon(
                            Icons.mail_outline,
                            color: AppColor.red_appcolor,
                          ),
                          hintText: 'Email'),
                    ),
                  ),

                  //**mobile  */
                  TextFormField(
                    controller: phone,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    validator: (_) {
                      if (phone.text.toString().isEmpty) {
                        return 'Enter Mobile Number';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius:
                              BorderRadius.circular(MediaQuerypage.pixel! * 6),
                        ),
                        filled: true,
                        fillColor: AppColor.grey_textFiled,
                        prefixIcon: Icon(
                          Icons.call,
                          color: AppColor.red_appcolor,
                        ),
                        hintText: 'Phone'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuerypage.safeBlockVertical! * 2),
                    child: TextFormField(
                      controller: location,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.words,
                      validator: (_) {
                        if (location.text.toString().isEmpty) {
                          return 'Enter Location';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(
                                MediaQuerypage.pixel! * 6),
                          ),
                          filled: true,
                          fillColor: AppColor.grey_textFiled,
                          prefixIcon: Icon(
                            Icons.location_on,
                            color: AppColor.red_appcolor,
                          ),
                          hintText: 'Location'),
                    ),
                  ),
                  //**blood grope selected */
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuerypage.screenHeight! * 0.02,
                    ),
                    child: Obx(
                      () => Wrap(
                        spacing: 10.0,
                        runSpacing: 10,
                        children: bloodgrope
                            .map((element) => InkWell(
                                  onTap: () {
                                    for (var e in bloodgrope) {
                                      e.ans.value = false;
                                    }
                                    element.ans.value = true;
                                    bloodgropeselected.value = element.name;
                                  },
                                  child: Container(
                                    width: MediaQuerypage.screenWidth! * 0.2,
                                    height: MediaQuerypage.screenHeight! * 0.06,
                                    alignment: Alignment.center,
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                        color: element.ans.value
                                            ? AppColor.red_appcolor
                                            : AppColor.white,
                                        border: Border.all(
                                          color: element.ans.value
                                              ? AppColor.white
                                              : AppColor.red_appcolor,
                                        ),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Text(
                                      element.name,
                                      style: element.ans.value
                                          ? Textstyle.whitebold16
                                          : Textstyle.blackbold16,
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuerypage.screenHeight! * 0.02,
                  ),
                  Text('Last Time Donate Date'),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuerypage.safeBlockHorizontal! * 3,
                    ),
                    child: DateTimePicker(
                      controller: date2,
                      type: DateTimePickerType.date,
                      dateMask: 'd MMM, yyyy',
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                      icon: Icon(Icons.event),
                      dateLabelText: 'Date',
                      timeLabelText: "Hour",
                      selectableDayPredicate: (date) {
                        // Disable weekend days to select from the calendar
                        if (date.weekday == 6 || date.weekday == 7) {
                          return false;
                        }
                        return true;
                      },
                      validator: (val) {
                        print(val);
                        return val!.isEmpty?'Enter last time donate date':null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: MediaQuerypage.screenHeight! * 0.02,
                  ),

                  ///***age */
                  TextFormField(
                    controller: age,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    validator: (_) {
                      if (age.text.toString().isEmpty) {
                        return 'Enter Age';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius:
                              BorderRadius.circular(MediaQuerypage.pixel! * 6),
                        ),
                        filled: true,
                        fillColor: AppColor.grey_textFiled,
                        prefixIcon: Icon(
                          Icons.accessibility,
                          color: AppColor.red_appcolor,
                        ),
                        hintText: 'Age'),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuerypage.safeBlockVertical! * 2),
                    child: TextFormField(
                      controller: donate_time,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      validator: (_) {
                        if (location.text.toString().isEmpty) {
                          return 'Blood donation ';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(
                                MediaQuerypage.pixel! * 6),
                          ),
                          filled: true,
                          fillColor: AppColor.grey_textFiled,
                          prefixIcon: Icon(
                            Icons.volunteer_activism,
                            color: AppColor.red_appcolor,
                          ),
                          hintText: 'Donate time'),
                    ),
                  ),

                  //**pasword */
                  Obx(
                    () => TextFormField(
                      controller: password,
                      obscureText: view.value,
                      textInputAction: TextInputAction.done,
                      validator: (_) {
                        Validation.passwordvalidation(password.text.toString());
                        return null;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(
                                MediaQuerypage.pixel! * 6),
                          ),
                          filled: true,
                          fillColor: AppColor.grey_textFiled,
                          prefixIcon: Icon(
                            Icons.lock,
                            color: AppColor.red_appcolor,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              view.value = !view.value;
                            },
                            icon: !view.value
                                ? Icon(
                                    Icons.remove_red_eye,
                                  )
                                : Icon(
                                    Icons.visibility_off,
                                  ),
                          ),
                          hintText: 'Password'),
                    ),
                  ),

                  //**
                  //**button add  */
                  // */
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuerypage.safeBlockVertical! * 3),
                    child: InkWell(
                      onTap: () async {
                        FocusScope.of(context).unfocus();
                        final progress = ProgressHUD.of(context);
                        if (fromkey.currentState!.validate()) {
                          progress!.show();
                          UserInformation userInfo = UserInformation(
                            name: username.text.toString(),
                            mobile: phone.text.toString(),
                            email: email.text.toString(),
                            location: location.text.toString(),
                            blood_grope: bloodgropeselected.value,
                            password: password.text.toString(),
                            donate_time: donate_time.text.toString(),
                            date: date2.text.toString(),
                            age: age.text.toString(),
                          );
                          //**user data sent datbase  */
                          String code = await registation_controller
                              .register_User(userInfo);
                          //**user image sent datbase  */
                          await registation_controller
                              .image_sentFirebase(UserInformation.userId);
                          if (fromkey.currentState!.validate()) {
                            //**not error is create from database then
                            //** goto second screen  */ */
                            ///**fromkey.currentState!.validate()  this
                            ///**useing  second for cheak email already taken or not */
                            progress.dismiss();
                            Get.offAllNamed(Dashboard.name);
                          } else {
                            //**when error find make error value nulll
                            //*** */ so that user cannot find error for update the error textfield */
                            Validation.emailvalidation('');
                            Validation.passwordvalidation('');
                            progress.dismiss();
                          }
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Text('Save', style: Textstyle.whitebold18),
                        width: MediaQuerypage.screenWidth,
                        height: MediaQuerypage.screenHeight! * 0.055,
                        decoration: BoxDecoration(
                            color: AppColor.red_appcolor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuerypage.screenHeight! * 0.02,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Already have an account?',
                      style: TextStyle(color: Colors.grey),
                      // ignore: prefer_const_literals_to_create_immutables
                      children: <TextSpan>[
                        TextSpan(
                            text: '\t Log-in',
                            style: TextStyle(
                                fontSize: MediaQuerypage.fontsize! * 15,
                                fontWeight: FontWeight.bold,
                                color: AppColor.red_appcolor)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    )));
  }
}
