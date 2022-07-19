// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, unused_field, must_be_immutable

import 'package:blood_donation_collage/design/Textstyle.dart';
import 'package:blood_donation_collage/design/appcolor.dart';
import 'package:blood_donation_collage/design/media_query.dart';
import 'package:blood_donation_collage/screen/my%20request%20view/view/myrequestview.dart';
import 'package:blood_donation_collage/screen/profile%20edit/view/profileEdit.dart';
import 'package:blood_donation_collage/screen/profile/controller/profileController.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/route_manager.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../helper/callingname.dart';
import 'component/logout.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);

  ProfileController profilecontroller = Get.put(ProfileController());
  Future<void>? _launched;
  RxBool isSwitched = false.obs;

  ///**user call button which go to moble call */
  Future<void> _makePhoneCall(String phoneNumber) async {
    // Use `Uri` to ensure that `phoneNumber` is properly URL-encoded.
    // Just using 'tel:$phoneNumber' would create invalid URLs in some cases,
    // such as spaces in the input, which would cause `launch` to fail on some
    // platforms.
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launch(launchUri.toString());
  }

  @override
  Widget build(BuildContext context) {
    //**call method for get information in api  */
    profilecontroller.getUserInformatio();
    profilecontroller.getdpImage();
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuerypage.safeBlockHorizontal! * 2,
            vertical: MediaQuerypage.safeBlockVertical!),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //***profile image view  */
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(MediaQuerypage.pixel! * 45),
                  border: Border.all(color: Colors.black, width: 3),
                ),
                child: profilecontroller.dpUrl.value == ''
                    ? Image(
                        fit: BoxFit.cover,
                        image: const AssetImage(
                          'assets/user.png',
                        ),
                      )
                    : Image.network(
                        profilecontroller.dpUrl.value,
                        width: MediaQuerypage.screenWidth! * 0.45,
                        height: MediaQuerypage.screenHeight! * 0.22,
                        fit: BoxFit.cover,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) return child;
                          return CircleAvatar(
                            radius: MediaQuerypage.pixel! * 40,
                            child: CircularProgressIndicator(
                              semanticsLabel: 'Loading',
                              color: AppColor.red_appcolor,
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                          .toDouble()
                                  : null,
                            ),
                          );
                        },
                        errorBuilder: (BuildContext context, Object exception,
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
              //*
              //*name and address
              //* */
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuerypage.safeBlockVertical! * 0.5),
                child: Text(
                  !profilecontroller.dataloadsuccesfull.value
                      ? 'loading'
                      : profilecontroller.userInfromation.value.name.toString(),
                  // textAlign: TextAlign.center,
                  style: Textstyle.redbold22,
                ),
              ),
              Text(
                !profilecontroller.dataloadsuccesfull.value
                    ? 'loading'
                    : profilecontroller.userInfromation.value.location
                        .toString(),
                // textAlign: TextAlign.center,
                style: Textstyle.black18,
              ),
              SizedBox(
                height: MediaQuerypage.screenHeight! * 0.01,
              ),
              /**
               * **blood grope & age & doation times
               */
              Wrap(
                spacing: MediaQuerypage.screenWidth! * 0.05,
                children: [
                  Card(
                    elevation: 5,
                    child: SizedBox(
                      height: MediaQuerypage.screenHeight! * 0.12,
                      width: MediaQuerypage.screenWidth! * 0.23,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            !profilecontroller.dataloadsuccesfull.value
                                ? 'loading'
                                : profilecontroller
                                    .userInfromation.value.blood_grope
                                    .toString(),
                            style: Textstyle.redbold24,
                          ),
                          Text('Blood Grope')
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 5,
                    child: SizedBox(
                      height: MediaQuerypage.screenHeight! * 0.12,
                      width: MediaQuerypage.screenWidth! * 0.23,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            !profilecontroller.dataloadsuccesfull.value
                                ? 'loading'
                                : profilecontroller.userInfromation.value.age
                                    .toString(),
                            style: Textstyle.redbold24,
                          ),
                          Text('Age')
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (profilecontroller.userInfromation.value.request
                              .toString() ==
                          '0') {
                        ///**show snaker ber
                        ///*if user have no reuest */
                        Get.snackbar(
                          "You have no donate request",
                          'For need anytype of blood grope creat request',
                          icon: Icon(Icons.person, color: Colors.black),
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.grey,
                          borderRadius: MediaQuerypage.pixel! * 9,
                          margin: EdgeInsets.all(MediaQuerypage.pixel! * 10),
                          colorText: Colors.black,
                          duration: Duration(seconds: 5),
                          isDismissible: true,
                          forwardAnimationCurve: Curves.easeOutBack,
                        );
                      } else {
                        Get.toNamed(MyRequest_View.name);
                      }
                    },
                    child: Card(
                      elevation: 5,
                      child: SizedBox(
                        height: MediaQuerypage.screenHeight! * 0.12,
                        width: MediaQuerypage.screenWidth! * 0.23,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              !profilecontroller.dataloadsuccesfull.value
                                  ? 'loading'
                                  : profilecontroller
                                      .userInfromation.value.request
                                      .toString(),
                              style: Textstyle.redbold24,
                            ),
                            Text('Requested')
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuerypage.safeBlockHorizontal! * 2,
                    vertical: MediaQuerypage.safeBlockVertical! * 0.2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Details', style: Textstyle.black16),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuerypage.safeBlockHorizontal! * 2),
                child: SizedBox(
                  width: MediaQuerypage.screenWidth!,
                  height: MediaQuerypage.screenHeight! * 0.4,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox.square(
                          dimension: MediaQuerypage.smallSizeHeight! * 1,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(MediaQuerypage.pixel! * 5)),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: ListTile(
                            leading: Text(CallingName.Mobile + ": ",
                                style: Textstyle.red16),
                            title: Text(
                                profilecontroller.userInfromation.value.mobile
                                    .toString(),
                                style: Textstyle.black16),
                            trailing: Icon(
                              Icons.phone,
                              color: AppColor.red_appcolor,
                            ),
                          ),
                        ),
                        SizedBox.square(
                          dimension: MediaQuerypage.smallSizeHeight! * 1,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(MediaQuerypage.pixel! * 5)),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: ListTile(
                            leading: Text(CallingName.Email + ": ",
                                style: Textstyle.red16),
                            trailing: Icon(
                              Icons.email,
                              color: AppColor.red_appcolor,
                            ),
                            title: Text(profilecontroller
                                .userInfromation.value.email
                                .toString()),
                          ),
                        ),
                        SizedBox.square(
                          dimension: MediaQuerypage.smallSizeHeight! * 1,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(MediaQuerypage.pixel! * 5)),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: ListTile(
                            leading: Text(CallingName.Donatetime,
                                style: Textstyle.red16),
                            trailing: Icon(
                              Icons.volunteer_activism,
                              color: AppColor.red_appcolor,
                            ),
                            title: Text(profilecontroller
                                .userInfromation.value.donate_time
                                .toString()),
                          ),
                        ),
                        SizedBox.square(
                          dimension: MediaQuerypage.smallSizeHeight! * 1,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(MediaQuerypage.pixel! * 5)),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: ListTile(
                            leading:
                                Text(CallingName.Date, style: Textstyle.red16),
                            trailing: Icon(
                              Icons.date_range,
                              color: AppColor.red_appcolor,
                            ),
                            title: Text(profilecontroller
                                .userInfromation.value.date
                                .toString()),
                          ),
                        ),
                        SizedBox.square(
                          dimension: MediaQuerypage.smallSizeHeight! * 1,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(MediaQuerypage.pixel! * 5)),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: ListTile(
                            leading: Icon(
                              Icons.info_outlined,
                              color: AppColor.red_appcolor,
                            ),
                            title: Text('Available for donate'),
                            trailing: Obx(
                              () => Switch(
                                value: isSwitched.value,
                                onChanged: (value) {
                                  isSwitched.value = value;
                                },
                                activeTrackColor: Color(0xFFF32D5C),
                                activeColor: AppColor.red_appcolor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox.square(
                          dimension: MediaQuerypage.smallSizeHeight! * 1,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(MediaQuerypage.pixel! * 5)),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: ListTile(
                            leading: Icon(
                              Icons.edit_outlined,
                              color: AppColor.red_appcolor,
                            ),
                            title: Text('Profile Edit'),
                            onTap: () {
                              Get.to(() => ProfileEdit());
                            },
                          ),
                        ),
                        SizedBox.square(
                          dimension: MediaQuerypage.smallSizeHeight! * 1,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(MediaQuerypage.pixel! * 5)),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: ListTile(
                            leading: Icon(
                              Icons.logout_outlined,
                              color: AppColor.red_appcolor,
                            ),
                            title: Text('log-out'),
                            onTap: () {
                              Logout(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
