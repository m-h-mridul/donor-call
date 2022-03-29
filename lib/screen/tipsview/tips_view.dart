// ignore_for_file: unused_local_variable

import 'package:blood_donation_collage/design/Textstyle.dart';
import 'package:blood_donation_collage/design/appcolor.dart';
import 'package:blood_donation_collage/design/media_query.dart';
import 'package:flutter/material.dart';

import 'row data/healthtips.dart';

class TipsView extends StatelessWidget {
  HealthTips healthTips;
  String s;
  TipsView(this.healthTips,this.s , {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuerypage.safeBlockVertical! * 1,
                horizontal: MediaQuerypage.safeBlockHorizontal! * 2),
            child: Column(
              children: [
                Hero(
                  tag: s,
                  child: Image(
                    fit: BoxFit.fill,
                    width: MediaQuerypage.screenWidth,
                    height: MediaQuerypage.screenHeight! * 0.2,
                    image: AssetImage(healthTips.headImage),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuerypage.safeBlockVertical! * 0.5,
                  ),
                  child: Text(
                    healthTips.headline,
                    style: Textstyle.blackbold28,
                  ),
                ),
                Divider(
                  color: AppColor.black,
                ),
                healthTips.discrbtion.isEmpty
                    ? Expanded(
                        child: ListView.builder(
                          itemCount: healthTips.item.length,
                          itemBuilder: (context, index) {
                            ItemDiscribtion item = healthTips.item[index];
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item.name, style: Textstyle.blackbold22),
                                Text(
                                  item.discribtion,
                                  style: Textstyle.black16,
                                ),
                                item.suggetion.isNotEmpty
                                    ? Text(
                                        item.suggetion,
                                        style: Textstyle.black16,
                                      )
                                    : const SizedBox(),
                              ],
                            );
                          },
                        ),
                      )
                    : Expanded(
                        child: SingleChildScrollView(
                          child: Text(
                            healthTips.discrbtion,
                            style: Textstyle.black16,
                          ),
                        ),
                      ),
              ],
            )),
      ),
    );
  }
}
