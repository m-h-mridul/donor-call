// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'dart:async';

import 'package:blood_donation_collage/resource/media_query.dart';
import 'package:blood_donation_collage/view/screen/Dashboard.dart';
import 'package:blood_donation_collage/view/screen/pageviewr.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  static const name = 'splash';
  SplashScreen(this.ans);
  bool? ans;
  @override
  Widget build(BuildContext context) {
    MediaQuerypage.init(context);
    Timer(
        Duration(seconds: 2),
        () => ans!
            ? Get.offAllNamed(Dashboard.name)
            : Get.offAllNamed(Pagevier.name));
    return Scaffold(
      backgroundColor: Color(0xFFFF2156),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Lottie.asset('assets/lotties/animation_kyg309ev.json'),
      ),
    );
  }
}
