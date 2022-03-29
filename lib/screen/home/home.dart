// ignore_for_file: override_on_non_overriding_member, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:blood_donation_collage/design/Textstyle.dart';
import 'package:blood_donation_collage/design/appcolor.dart';
import 'package:blood_donation_collage/design/media_query.dart';
import 'package:blood_donation_collage/screen/log-in/log-in.dart';
import 'package:blood_donation_collage/screen/registation/Registation.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  static const name = 'home';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/Logo.png'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuerypage.safeBlockHorizontal! * 10,
                    vertical: MediaQuerypage.safeBlockHorizontal! * 5),
                child: Image(
                  image: AssetImage('assets/home2.png'),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuerypage.safeBlockHorizontal! * 10,
                    vertical: MediaQuerypage.safeBlockHorizontal! * 5),
                child: Text(
                  'You can donate for ones in need and\n request blood if you need.',
                  style: TextStyle(
                      fontSize: MediaQuerypage.fontsize! * 15,
                      color: AppColor.grey),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(Login.name);
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text('Log-in', style: Textstyle.redbold18),
                  width: MediaQuerypage.screenWidth,
                  height: MediaQuerypage.screenHeight! * 0.06,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: AppColor.red_appcolor,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
              SizedBox(
                height: MediaQuerypage.smallSizeHeight! * 1,
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(Registation.name);
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text('register', style: Textstyle.whitebold18),
                  width: MediaQuerypage.screenWidth,
                  height: MediaQuerypage.screenHeight! * 0.06,
                  decoration: BoxDecoration(
                      color: AppColor.red_appcolor,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
