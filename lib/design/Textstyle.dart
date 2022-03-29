// ignore_for_file: file_names, non_constant_identifier_names

import 'package:blood_donation_collage/design/appcolor.dart';
import 'package:blood_donation_collage/design/media_query.dart';
import 'package:flutter/material.dart';

class Textstyle {
  static TextStyle bold32 = TextStyle(
      fontSize: MediaQuerypage.fontsize! * 32, fontWeight: FontWeight.bold);
  static TextStyle blackbold28 = TextStyle(
      fontSize: MediaQuerypage.fontsize! * 28, fontWeight: FontWeight.bold);
      
       static TextStyle blackbold20= TextStyle(
      fontSize: MediaQuerypage.fontsize! * 20, fontWeight: FontWeight.bold);

  static TextStyle appcolor = TextStyle(color: AppColor.red_appcolor);

  static TextStyle black16 =
      TextStyle(fontSize: MediaQuerypage.fontsize! * 16, color: Colors.black);
      static TextStyle only16 =
      TextStyle(fontSize: MediaQuerypage.fontsize! * 16,);
  static TextStyle black18 =
      TextStyle(fontSize: MediaQuerypage.fontsize! * 18, color: Colors.black);

  static TextStyle black = const TextStyle(color: Colors.black);

  static TextStyle redbold24 = TextStyle(
      color: AppColor.red_appcolor,
      fontWeight: FontWeight.bold,
      fontSize: MediaQuerypage.fontsize! * 24);

  static TextStyle blackbold22 = TextStyle(
      color: Colors.black,
      fontSize: MediaQuerypage.fontsize! * 22,
      fontWeight: FontWeight.bold);

  static TextStyle bold20 = TextStyle(
      fontSize: MediaQuerypage.fontsize! * 20, fontWeight: FontWeight.bold);

  static TextStyle bold18 = TextStyle(
      fontSize: MediaQuerypage.fontsize! * 18, fontWeight: FontWeight.bold);

  static TextStyle whitebold18 = TextStyle(
      fontSize: MediaQuerypage.fontsize! * 18,
      fontWeight: FontWeight.bold,
      color: Colors.white);

  static TextStyle redbold18 = TextStyle(
      fontSize: MediaQuerypage.fontsize! * 18,
      fontWeight: FontWeight.bold,
      color: AppColor.red_appcolor);

  static TextStyle blackbold16 = TextStyle(
    color: Colors.black,
    fontSize: MediaQuerypage.fontsize! * 16,
    fontWeight: FontWeight.bold,
  );
  static TextStyle whitebold16 = TextStyle(
    color: Colors.white,
    fontSize: MediaQuerypage.fontsize! * 16,
    fontWeight: FontWeight.bold,
  );
  static TextStyle grey16 = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.bold,
    fontSize: MediaQuerypage.fontsize! * 16,
  );

  static TextStyle dashboard_doante_request = TextStyle(
      fontWeight: FontWeight.bold, fontSize: MediaQuerypage.fontsize! * 18);
  static TextStyle red22 = TextStyle(
      fontSize: MediaQuerypage.fontsize! * 22, color: AppColor.red_appcolor);

  static TextStyle grey = const TextStyle(color: Colors.grey);
}
