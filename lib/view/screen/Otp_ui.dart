// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, file_names

import 'package:blood_donation_collage/resource/Textstyle.dart';
import 'package:blood_donation_collage/resource/appcolor.dart';
import 'package:blood_donation_collage/resource/media_query.dart';
import 'package:blood_donation_collage/view/screen/Successful.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:sms_autofill/sms_autofill.dart';

class Otpui extends StatefulWidget {
  Otpui({Key? key}) : super(key: key);
  static const name = 'Otpui';

  @override
  State<Otpui> createState() => _OtpuiState();
}

class _OtpuiState extends State<Otpui> with CodeAutoFill {
  String? otpCode;
  String? appSignature;

  @override
  void codeUpdated() {
    setState(() {
      otpCode = code!;
    });
  }

  @override
  void initState() {
    super.initState();
    //listenthecode();
  }

  listenthecode() async {
    await SmsAutoFill().listenForCode();
  }

  @override
  void dispose() {
    SmsAutoFill().unregisterListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuerypage.safeBlockHorizontal! * 3,
            vertical: MediaQuerypage.safeBlockVertical! * 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Center(
                child: Text(
              'Enter Your Verification Code',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            )),
            SizedBox(
              height: MediaQuerypage.screenHeight! * 0.01,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuerypage.safeBlockHorizontal! * 10,
                  vertical: MediaQuerypage.safeBlockVertical! * 3),
              child: PinFieldAutoFill(
                decoration: BoxLooseDecoration(
                    gapSpace: MediaQuerypage.smallSizeWidth! * 8,
                    strokeColorBuilder:
                        PinListenColorBuilder(Colors.grey, Colors.grey),
                    bgColorBuilder: PinListenColorBuilder(
                        Color(0xFFECF2FE), Color(0xFFECF2FE))),
                currentCode: otpCode,
                codeLength: 4,
                onCodeChanged: (code) {
                  if (code!.length == 4) {}
                },
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(()=>Successfull('Verify'));
              },
              child: Container(
                alignment: Alignment.center,
                child: Text('Verify', style: Textstyle.whitebold18),
                width: MediaQuerypage.screenWidth,
                height: MediaQuerypage.screenHeight! * 0.06,
                decoration: BoxDecoration(
                    color: AppColor.red_appcolor,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
