// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, duplicate_ignore, file_names, must_be_immutable, camel_case_types, unused_field

import 'package:blood_donation_collage/resource/Textstyle.dart';
import 'package:blood_donation_collage/resource/media_query.dart';
import 'package:blood_donation_collage/view/screen/ambulanceui.dart';
import 'package:blood_donation_collage/view/screen/hosipitalemergecy.dart';
import 'package:blood_donation_collage/view/screen/request.dart';
import 'package:blood_donation_collage/view/screen/Search.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import '../../resource/text.dart';
import '../../helper/internetconnectivity.dart';
import 'bloodbankui.dart';
import 'DoctorUI.dart';
import 'notfificationUI.dart';
import '../widget/RowDataAdd.dart';
import '../widget/healthtips.dart';
import 'tips_view.dart';

class Dash_home extends StatelessWidget {
  Dash_home({Key? key}) : super(key: key);
  //**
  //*page viewre
  // */
  PageController controller = PageController();

  //**news list  */
  RowDataAdd newslist = RowDataAdd();

  @override
  Widget build(BuildContext context) {
    newslist.addhealthlist();
    Internetcheaker();
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuerypage.safeBlockHorizontal! * 1,
          vertical: MediaQuerypage.safeBlockVertical! * 0.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
             padding: EdgeInsets.symmetric(
                      horizontal: MediaQuerypage.safeBlockHorizontal! * 4,
                      vertical: MediaQuerypage.safeBlockVertical! * 0.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment:CrossAxisAlignment.center,
              children: [
                Text(TextLine.dashboardHeadline,style:Textstyle.black18headline),
                IconButton(
                  onPressed: () {
                    Get.to(() => NotificationUI());
                  },
                  icon: Icon(
                    Icons.notifications_outlined,
                    size: MediaQuerypage.pixel! * 11,
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Wrap(
              runSpacing: MediaQuerypage.smallSizeHeight! * 1.3,
              spacing: MediaQuerypage.smallSizeWidth! * 3.3,
              children: [
                InkWell(
                  onTap: () {
                    Internetcheaker().intenetConnectivity();
                    if (Internetcheaker.ans.value) {
                      Get.toNamed(Search.name);
                    }
                  },
                  child: Card(
                    elevation: 3,
                    child: SizedBox(
                      height: MediaQuerypage.screenHeight! * 0.13,
                      width: MediaQuerypage.screenWidth! * 0.25,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image(
                            width: MediaQuerypage.screenWidth! * 0.3,
                            height: MediaQuerypage.screenHeight! * .06,
                            image: AssetImage('assets/donate.png'),
                          ),
                          Text('Finds Donors')
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Internetcheaker().intenetConnectivity();
                    if (Internetcheaker.ans.value) {
                      Get.toNamed(Request.name);
                    }
                  },
                  child: Card(
                    elevation: 3,
                    child: SizedBox(
                      height: MediaQuerypage.screenHeight! * 0.13,
                      width: MediaQuerypage.screenWidth! * 0.25,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image(
                            width: MediaQuerypage.screenWidth! * 0.3,
                            height: MediaQuerypage.screenHeight! * .06,
                            image: AssetImage('assets/blood.png'),
                          ),
                          Text('Request')
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(HospitalEmergncy.name);
                  },
                  child: Card(
                    elevation: 3,
                    child: SizedBox(
                      height: MediaQuerypage.screenHeight! * 0.13,
                      width: MediaQuerypage.screenWidth! * 0.25,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image(
                            width: MediaQuerypage.screenWidth! * 0.3,
                            height: MediaQuerypage.screenHeight! * .06,
                            image: AssetImage('assets/donate2.png'),
                          ),
                          Text('Emergency')
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(DoctorUI.name);
                  },
                  child: Card(
                    elevation: 3,
                    child: SizedBox(
                      height: MediaQuerypage.screenHeight! * 0.13,
                      width: MediaQuerypage.screenWidth! * 0.25,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image(
                            width: MediaQuerypage.screenWidth! * 0.3,
                            height: MediaQuerypage.screenHeight! * .06,
                            image: AssetImage('assets/doctor.png'),
                          ),
                          Text('Doctors')
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(AmbulanceUI.name);
                  },
                  child: Card(
                    elevation: 3,
                    child: SizedBox(
                      height: MediaQuerypage.screenHeight! * 0.13,
                      width: MediaQuerypage.screenWidth! * 0.25,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image(
                            //fit: BoxFit.none,
                            width: MediaQuerypage.screenWidth! * 0.3,
                            height: MediaQuerypage.screenHeight! * .06,

                            image: AssetImage('assets/ambulance.png'),
                          ),
                          Text('Ambulance')
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(BloodBankView.name);
                  },
                  child: Card(
                    elevation: 3,
                    child: SizedBox(
                      height: MediaQuerypage.screenHeight! * 0.13,
                      width: MediaQuerypage.screenWidth! * 0.25,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image(
                            width: MediaQuerypage.screenWidth! * 0.3,
                            height: MediaQuerypage.screenHeight! * .06,
                            image: AssetImage('assets/noti.png'),
                          ),
                          Text('Blood Bank')
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuerypage.safeBlockVertical! * 1,
                horizontal: MediaQuerypage.safeBlockHorizontal! * 4),
            child: Text('Health tips', style: Textstyle.blackbold17),
          ),
          Expanded(
            child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                itemCount: newslist.allhealthtip.length,
                itemBuilder: (BuildContext context, int index) {
                  HealthTips healthTips = newslist.allhealthtip[index];
                  return InkWell(
                    onTap: () {
                      Get.to(() => TipsView(healthTips, healthTips.headline));
                    },
                    child: ListTile(
                      leading: Hero(
                        tag: healthTips.headline,
                        child: Image(
                          fit: BoxFit.fill,
                          height: MediaQuerypage.screenHeight! * 0.07,
                          width: MediaQuerypage.screenWidth! * 0.25,
                          image: AssetImage(healthTips.headImage),
                        ),
                      ),
                      title: Text(healthTips.headline),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
