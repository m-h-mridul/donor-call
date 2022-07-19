// ignore_for_file: prefer_const_constructors

import 'package:blood_donation_collage/resource/appcolor.dart';
import 'package:blood_donation_collage/resource/media_query.dart';
import 'package:flutter/material.dart';

pageview(String value, int page) => Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Image(
              width: MediaQuerypage.screenWidth!,
              fit: BoxFit.fill,
              image: AssetImage(value),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(bottom: MediaQuerypage.smallSizeHeight! * 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: MediaQuerypage.pixel! * 2,
                  backgroundColor:
                      page == 0 ? AppColor.red_appcolor : Colors.grey,
                ),
                SizedBox(
                  width: MediaQuerypage.screenWidth! * 0.01,
                ),
                CircleAvatar(
                  radius: MediaQuerypage.pixel! * 2,
                  backgroundColor:
                      page == 1 ? AppColor.red_appcolor : Colors.grey,
                ),
                SizedBox(
                  width: MediaQuerypage.screenWidth! * 0.01,
                ),
                CircleAvatar(
                  radius: MediaQuerypage.pixel! * 2,
                  backgroundColor:
                      page == 2 ? AppColor.red_appcolor : Colors.grey,
                ),
                SizedBox(
                  width: MediaQuerypage.screenWidth! * 0.01,
                ),
                CircleAvatar(
                  radius: MediaQuerypage.pixel! * 2,
                  backgroundColor:
                      page == 3 ? AppColor.red_appcolor : Colors.grey,
                )
              ],
            ),
          ),
        ]);
