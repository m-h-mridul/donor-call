// ignore_for_file: prefer_const_constructors, invalid_use_of_protected_member, must_be_immutable, file_names, camel_case_types, unused_element

import 'package:blood_donation_collage/resource/Textstyle.dart';
import 'package:blood_donation_collage/resource/appcolor.dart';
import 'package:blood_donation_collage/resource/media_query.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/state_manager.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../controller/doner_requestcontroller.dart';
import '../../model/donerrequestmodel.dart';
import 'package:blood_donation_collage/controller/Donerrequest_controller.dart';


class DonarRequest_View extends StatelessWidget {
  static const name = 'DonarRequest_View';
  DonarRequest_View({Key? key}) : super(key: key);
  //**
  //*variable
  // */
  DonerRequestController donerRequestController =
      Get.put(DonerRequestController());
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
          elevation: 1,
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Text('Donar Request', style: TextStyle(color: Colors.black)),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuerypage.safeBlockVertical! * 1,
              horizontal: MediaQuerypage.safeBlockHorizontal! * 2),
          child: GetX<DonerRequestController>(
            init: DonerRequestController(),
            builder: (controller) => donerRequestController
                    .requestlist.value.isEmpty
                ? Center(child: Text('Loading request'))
                : ListView.builder(
                    itemCount: donerRequestController.requestlist.value.length,
                    itemBuilder: (context, index) {
                      DonerRqequest_model dt =
                          donerRequestController.requestlist.value[index];
                      return Card(
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
                                        MediaQuerypage.safeBlockHorizontal! * 3,
                                    vertical:
                                        MediaQuerypage.safeBlockVertical! * 3),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                            style: TextStyle(
                                              fontSize:
                                                  MediaQuerypage.fontsize! * 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
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
                                    height: MediaQuerypage.screenHeight! * 0.03,
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
                      );
                    }),
          ),
        ));
  }
}
