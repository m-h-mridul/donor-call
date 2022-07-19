// ignore_for_file: prefer_const_constructors, invalid_use_of_protected_member, must_be_immutable, file_names, camel_case_types, unused_element

import 'package:blood_donation_collage/resource/Textstyle.dart';
import 'package:blood_donation_collage/resource/appcolor.dart';
import 'package:blood_donation_collage/resource/media_query.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/state_manager.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../helper/callingname.dart';
import '../../model/donerrequestmodel.dart';
import '../../controller/Donerrequest_controller.dart';

class MyRequest_View extends StatelessWidget {
  static const name = 'MyRequest_View';
  MyRequest_View({Key? key}) : super(key: key);
  //**
  //*variable
  // */
  MyRequestController donerRequestController = Get.put(MyRequestController());
  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Text('My Request', style: TextStyle(color: Colors.black)),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuerypage.safeBlockVertical! * 1,
              horizontal: MediaQuerypage.safeBlockHorizontal! * 2),
          child: GetX<MyRequestController>(
            init: MyRequestController(),
            builder: (controller) => donerRequestController
                    .requestlist.value.isEmpty
                ? Center(child: Text('Loading request'))
                : ListView.builder(
                    itemCount: donerRequestController.requestlist.value.length,
                    itemBuilder: (context, index) {
                      DonerRqequest_model dt =
                          donerRequestController.requestlist.value[index];
                      return FocusedMenuHolder(
                        onPressed: () {},
                        child: Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                MediaQuerypage.pixel! * 9), // if you need this
                            side: BorderSide(
                              color: Colors.grey.withOpacity(0.8),
                              width: 1.5,
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          MediaQuerypage.safeBlockHorizontal! *
                                              3,
                                      vertical:
                                          MediaQuerypage.safeBlockVertical! *
                                              3),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Patient Details',
                                        style: Textstyle.redbold18,
                                      ),
                                      Text(
                                        dt.notes!,
                                        style: Textstyle.black16,
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuerypage.smallSizeHeight! * 3,
                                      ),
                                      Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Hospital Name: ',
                                              style: Textstyle.grey16,
                                            ),
                                            TextSpan(
                                              text: dt.hospital!,
                                              style: Textstyle.bold20,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Location: ',
                                              style: Textstyle.grey16,
                                            ),
                                            TextSpan(
                                                text: dt.location!,
                                                style: Textstyle.blackbold16),
                                          ],
                                        ),
                                      ),
                                      Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Date: ',
                                              style: Textstyle.grey16,
                                            ),
                                            TextSpan(
                                              text: dt.date!,
                                              style: Textstyle.bold20,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: AppColor.red_appcolor,
                                      radius: MediaQuerypage.pixel! * 10,
                                      child: Text(
                                        dt.bloodgrope!,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize:
                                                MediaQuerypage.fontsize! * 26),
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuerypage.screenHeight! * 0.03,
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        _makePhoneCall(dt.mobile.toString());
                                      },
                                      icon: Icon(
                                        Icons.phone_enabled,
                                        size: MediaQuerypage.pixel! * 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        menuItems: [
                          FocusedMenuItem(
                              title: Text(
                                "Delete",
                                style: TextStyle(color: Colors.redAccent),
                              ),
                              trailingIcon: Icon(
                                Icons.delete,
                                color: Colors.redAccent,
                              ),
                              onPressed: () {
                                CollectionReference users = FirebaseFirestore
                                    .instance
                                    .collection(CallingName.Donate_request);
                                users.doc(dt.request_id).delete();
                              }),
                          FocusedMenuItem(
                              title: Text("Cancel"),
                              trailingIcon: Icon(Icons.open_in_new),
                              onPressed: () {}),
                        ],
                      );
                    }),
          ),
        ));
  }
}
