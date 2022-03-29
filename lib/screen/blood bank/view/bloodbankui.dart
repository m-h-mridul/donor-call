// ignore_for_file: must_be_immutable

import 'package:blood_donation_collage/design/Textstyle.dart';
import 'package:blood_donation_collage/design/media_query.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../model/campaineModel.dart';
import '../model/datainsert.dart';

class BloodBankView extends StatelessWidget {
  static const name = 'CampaineUI';
  BloodBankView({Key? key}) : super(key: key);

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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          title: const Text(
            'Blood Bank in Dhaka',
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuerypage.safeBlockHorizontal! * 2,
              vertical: MediaQuerypage.safeBlockVertical! * 2),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(
                          height: 2,
                        ),
                    itemCount: dataModel.length,
                    itemBuilder: (BuildContext context, int index) {
                      CampaineData data = dataModel[index];
                      return ListTile(
                        leading: Image(
                          //fit: BoxFit.cover,
                          height: MediaQuerypage.screenHeight! * 0.08,
                          width: MediaQuerypage.screenWidth! * 0.2,
                          image: AssetImage(data.image),
                        ),
                        title: Text(data.title),
                        subtitle: Text(data.discribtion),
                        trailing: IconButton(
                          onPressed: () {
                            _makePhoneCall(data.mobile);
                          },
                          icon: const Icon(
                            Icons.phone_enabled,
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
