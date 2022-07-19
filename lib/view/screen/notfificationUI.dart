// ignore_for_file: file_names, invalid_use_of_protected_member

import 'package:blood_donation_collage/model/searchviewModel.dart';
import 'package:blood_donation_collage/view/simmer%20ui/simmeruiforNoitfication.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/route_manager.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../resource/Textstyle.dart';

import '../../controller/NotificationController.dart';

class NotificationUI extends StatelessWidget {
  static const name = 'NotificationUI';
  NotificationUI({Key? key}) : super(key: key);
  NotificationController notificationController = NotificationController();

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

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
          backgroundColor: Colors.white,
          title: const Text('Notification'),
        ),
        body: Obx(() => notificationController.notificationlist.value.isNotEmpty
            ? ListView.separated(
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(
                  thickness: 1,
                  color: Colors.black,
                ),
                itemCount: notificationController.notificationlist.value.length,
                itemBuilder: (context, index) {
                  SearchViewModel dt =
                      notificationController.notificationlist.value[index];
                  return ListTile(
                    leading: Text(
                      dt.bloodGrope,
                      style: Textstyle.redbold24,
                    ),
                    title: Text(dt.notes),
                  );
                },
              )
            : const SimmerUIForNotification()),
      ),
    );
  }
}
