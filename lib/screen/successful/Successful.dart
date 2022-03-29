// ignore_for_file: prefer_const_constructors

import 'package:blood_donation_collage/design/Textstyle.dart';
import 'package:blood_donation_collage/design/appcolor.dart';
import 'package:blood_donation_collage/design/media_query.dart';
import 'package:blood_donation_collage/screen/dashboard/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:lottie/lottie.dart';

class Successfull extends StatelessWidget {
  String s;
   Successfull(this.s, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuerypage.safeBlockHorizontal! * 3,
          vertical: MediaQuerypage.safeBlockVertical! * 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/lottie/50549-done.json'),
          SizedBox(
            height: MediaQuerypage.screenHeight! * 0.15,
          ),
          InkWell(
            onTap: () {
              Get.offAllNamed(Dashboard.name);
            },
            child: Container(
              alignment: Alignment.center,
              child: Text(s, style: Textstyle.whitebold18),
              width: MediaQuerypage.screenWidth,
              height: MediaQuerypage.screenHeight! * 0.06,
              decoration: BoxDecoration(
                  color: AppColor.red_appcolor,
                  border: Border.all(
                    color: AppColor.black,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
          ),
        ],
      ),
    )));
  }
}
