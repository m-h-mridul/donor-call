// ignore_for_file: must_be_immutable, file_names, non_constant_identifier_names, unused_local_variable

import 'dart:io';
import 'package:blood_donation_collage/design/Textstyle.dart';
import 'package:blood_donation_collage/design/appcolor.dart';
import 'package:blood_donation_collage/design/media_query.dart';
import 'package:blood_donation_collage/screen/profile%20edit/contoller/profileEditcontroller.dart';
import 'package:blood_donation_collage/screen/profile/controller/profileController.dart';
import 'package:blood_donation_collage/screen/registation/model/model_Userinformation.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';

class ProfileEdit extends StatelessWidget {
  ProfileEdit({Key? key}) : super(key: key);
  //**variavle */
  ProfileController controller = Get.find<ProfileController>();
  ProfileEditContoller profileEditContoller = Get.put(ProfileEditContoller());
  @override
  Widget build(BuildContext context) {
    //**variable that edit editor */
    TextEditingController username =
        TextEditingController(text: controller.userInfromation.value.name);
    TextEditingController donate_time = TextEditingController(
        text: controller.userInfromation.value.donate_time);
    TextEditingController date2 = TextEditingController(
      text: controller.userInfromation.value.date,
    );
    TextEditingController location =
        TextEditingController(text: controller.userInfromation.value.location);
    TextEditingController mobile =
        TextEditingController(text: controller.userInfromation.value.mobile);
    TextEditingController age =
        TextEditingController(text: controller.userInfromation.value.age);
    TextEditingController bloodtye = TextEditingController(
        text: controller.userInfromation.value.blood_grope);
    TextEditingController email =
        TextEditingController(text: controller.userInfromation.value.email);
    TextEditingController password = TextEditingController();
    TextEditingController confirmpassword = TextEditingController();
    return SafeArea(child: Scaffold(
      body: ProgressHUD(
        child: Builder(builder: (context) {
          return SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuerypage.safeBlockVertical! * 2,
                horizontal: MediaQuerypage.safeBlockHorizontal! * 3),
            child: Column(
              children: [
                //**image get gallery or change and also view previous image that is upload by user */
                InkWell(
                  onTap: () async {
                    await profileEditContoller.imageGetGellery();
                  },
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(MediaQuerypage.pixel! * 45),
                    child: Obx(
                      () => profileEditContoller.imagefilename.value != ''
                          ? Image.file(
                              File(profileEditContoller.imagefilename.value),
                              fit: BoxFit.fill,
                            )
                          : Image.network(
                              controller.dpUrl.value,
                              width: MediaQuerypage.screenWidth! * 0.45,
                              height: MediaQuerypage.screenHeight! * 0.22,
                              fit: BoxFit.fill,
                              loadingBuilder: (BuildContext context,
                                  Widget child,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) return child;
                                return CircleAvatar(
                                    radius: MediaQuerypage.pixel! * 40,
                                    child: CircularProgressIndicator(
                                      color: AppColor.red_appcolor,
                                      value:
                                          loadingProgress.expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                                      .toDouble()
                                              : null,
                                    ));
                              },
                              errorBuilder: (BuildContext context,
                                      Object exception,
                                      StackTrace? stackTrace) =>
                                  Image(
                                width: MediaQuerypage.screenWidth,
                                height: MediaQuerypage.screenHeight! / 4,
                                image: const AssetImage(
                                  'assets/user.png',
                                ),
                              ),
                            ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuerypage.screenHeight! * 0.03,
                ),
                //**name ediotr */
                TextField(
                  controller: username,
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
                  ),
                ),
                SizedBox(
                  height: MediaQuerypage.screenHeight! * 0.01,
                ),
                //**location editor */
                TextField(
                  controller: location,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius:
                          BorderRadius.circular(MediaQuerypage.pixel! * 6),
                    ),
                    filled: true,
                    fillColor: AppColor.grey_textFiled,
                    prefixIcon: Icon(
                      Icons.location_on,
                      color: AppColor.red_appcolor,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuerypage.screenHeight! * 0.01,
                ),
                //**textfiled mobile */
                TextField(
                  controller: mobile,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius:
                          BorderRadius.circular(MediaQuerypage.pixel! * 6),
                    ),
                    filled: true,
                    fillColor: AppColor.grey_textFiled,
                    prefixIcon: Icon(
                      Icons.settings_phone,
                      color: AppColor.red_appcolor,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuerypage.screenHeight! * 0.01,
                ),

                TextField(
                  controller: bloodtye,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius:
                          BorderRadius.circular(MediaQuerypage.pixel! * 6),
                    ),
                    filled: true,
                    fillColor: AppColor.grey_textFiled,
                    prefixIcon: Icon(
                      Icons.bloodtype,
                      color: AppColor.red_appcolor,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuerypage.screenHeight! * 0.01,
                ),
                TextField(
                  controller: email,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius:
                          BorderRadius.circular(MediaQuerypage.pixel! * 6),
                    ),
                    filled: true,
                    fillColor: AppColor.grey_textFiled,
                    prefixIcon: Icon(
                      Icons.mail_outline,
                      color: AppColor.red_appcolor,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuerypage.safeBlockVertical! * 2),
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
                          borderRadius:
                              BorderRadius.circular(MediaQuerypage.pixel! * 6),
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
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuerypage.safeBlockVertical! * 2,
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
                      return 'Enter last time donate date';
                    },
                  ),
                ),
                //***save button  */
                InkWell(
                  onTap: () async {
                    FocusScope.of(context).unfocus();
                    final progress = ProgressHUD.of(context);
                    progress!.show();
                    UserInformation userInfo = UserInformation(
                      name: username.text.toString(),
                      mobile: mobile.text.toString(),
                      email: email.text.toString(),
                      location: location.text.toString(),
                      blood_grope: bloodtye.text.toString(),
                      password: password.text.toString(),
                      donate_time: donate_time.text.toString(),
                      date: date2.text.toString(),
                      age: age.text.toString(),
                    );
                    //**sent data in firebase  */
                    await profileEditContoller.UpdatedataIn_firebase(userInfo);
                    await profileEditContoller
                        .image_sentFirebase(UserInformation.userId);
                    progress.dismiss();
                    Get.back();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Text('Save', style: Textstyle.whitebold18),
                    width: MediaQuerypage.screenWidth,
                    height: MediaQuerypage.screenHeight! * 0.055,
                    decoration: BoxDecoration(
                        color: AppColor.red_appcolor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                  ),
                ),
              ],
            ),
          ));
        }),
      ),
    ));
  }
}
