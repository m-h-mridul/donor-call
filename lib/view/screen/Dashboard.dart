// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, file_names

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:blood_donation_collage/resource/appcolor.dart';
import 'package:blood_donation_collage/resource/media_query.dart';
import 'package:blood_donation_collage/view/screen/DonarRequest.dart';
import 'package:blood_donation_collage/view/screen/dash_Home.dart';
import 'package:blood_donation_collage/controller/Dashboard_controller.dart';
import 'package:blood_donation_collage/view/screen/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/route_manager.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);
  static const name = 'dashboard';
  List<Widget> l = [
    Dash_home(),
    DonarRequest_View(),
    Profile(),
  ];
  //**
  //*bottom naviagation bar
  // */
  final iconList = <IconData>[
    Icons.home_outlined,
    Icons.newspaper,
    Icons.person_outline,
  ];
  //**
  //*controller
  // */
  DashboardController dashboardController = Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    //**status bar theam
    // */
     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, 
      systemNavigationBarDividerColor: Colors.grey,// navigation bar color
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark // status bar color
      ));
    
    return SafeArea(
      child: Scaffold(
        body: Obx(() => l[dashboardController.bottom_view.value]),
        bottomNavigationBar: Obx(
          () => AnimatedBottomNavigationBar(
            activeColor: AppColor.red_appcolor,
            icons: iconList,
            activeIndex: dashboardController.bottom_view.value,
            gapLocation: GapLocation.none,
            notchSmoothness: NotchSmoothness.verySmoothEdge,
            leftCornerRadius: MediaQuerypage.pixel! * 1,
            rightCornerRadius: MediaQuerypage.pixel! * 1,
            onTap: (index) {
              dashboardController.onbottomview_change(index);
            },
            //other params
          ),
        ),
      ),
    );
  }
}
