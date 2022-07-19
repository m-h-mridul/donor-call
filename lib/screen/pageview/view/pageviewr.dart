// ignore_for_file: override_on_non_overriding_member, prefer_const_constructors, must_be_immutable

import 'package:blood_donation_collage/design/appcolor.dart';
import 'package:blood_donation_collage/design/media_query.dart';
import 'package:blood_donation_collage/screen/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';

class Pagevier extends StatelessWidget {
  Pagevier({Key? key}) : super(key: key);
  static const name = 'pagevier';
  PageController controller = PageController();
  List<Widget> wd = [
    Image(
      image: AssetImage('assets/others/Onboarding 1.jpg'),
    ),
    Image(
      image: AssetImage('assets/others/page2.jpg'),
    )
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, 
      systemNavigationBarDividerColor: Colors.black,// navigation bar color
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark // status bar color
      ));
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: controller,
          scrollDirection: Axis.horizontal,
          children: wd,
        ),
        floatingActionButton: ElevatedButton(
          child: Text(
            'Next',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Get.toNamed(Home.name);
          },
          style: ElevatedButton.styleFrom(
              primary: AppColor.red_appcolor,
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuerypage.safeBlockHorizontal! * 5,
                  vertical: MediaQuerypage.safeBlockVertical! * 1.5),
              textStyle: TextStyle(
                  fontSize: MediaQuerypage.fontsize! * 20,
                  fontWeight: FontWeight.bold)),
        ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
