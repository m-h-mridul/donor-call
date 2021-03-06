// ignore_for_file: override_on_non_overriding_member, prefer_const_constructors, must_be_immutable

import 'package:blood_donation_collage/resource/appcolor.dart';
import 'package:blood_donation_collage/resource/media_query.dart';
import 'package:blood_donation_collage/model/randomModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/SearchController.dart';
import '../../resource/Textstyle.dart';
import '../../model/bloodmodel.dart';
import '../../view/screen/searchview.dart';

class Search extends StatelessWidget {
  static const name = 'Search';
  Search({Key? key}) : super(key: key);
  //**
  // */
  SearchController searchController = Get.put(SearchController());
  TextEditingController location = TextEditingController();
  TextEditingController area = TextEditingController();
  RxString bloodgropeselected = 'AB+'.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text('Search Donor', style: Textstyle.blackbold22),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuerypage.safeBlockHorizontal! * 3,
            vertical: MediaQuerypage.safeBlockVertical! * 2),
        child: Column(children: [
          Obx(
            () => Wrap(
              spacing: 10.0,
              runSpacing: 10,
              children: bloodgrope
                  .map((element) => InkWell(
                        onTap: () {
                          for (var e in bloodgrope) {
                            e.ans.value = false;
                          }
                          element.ans.value = true;
                          bloodgropeselected.value = element.name;
                        },
                        child: Container(
                          width: MediaQuerypage.screenWidth! * 0.2,
                          height: MediaQuerypage.screenHeight! * 0.06,
                          alignment: Alignment.center,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                              color: element.ans.value
                                  ? AppColor.red_appcolor
                                  : AppColor.white,
                              border: Border.all(
                                color: element.ans.value
                                    ? AppColor.white
                                    : AppColor.red_appcolor,
                              ),
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            element.name,
                            style: element.ans.value
                                ? Textstyle.whitebold16
                                : Textstyle.blackbold16,
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuerypage.safeBlockHorizontal! * 3,
                vertical: MediaQuerypage.safeBlockVertical! * 2),
            child: TextField(
              controller: location,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: AppColor.grey_textFiled,
                  prefixIcon: Icon(
                    Icons.fmd_good,
                    color: AppColor.grey,
                  ),
                  hintText: 'location'),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuerypage.safeBlockHorizontal! * 3,
            ),
            child: TextField(
              controller: area,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: AppColor.grey_textFiled,
                  prefixIcon: Icon(
                    Icons.location_city,
                    color: AppColor.grey,
                  ),
                  hintText: 'area'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuerypage.safeBlockVertical! * 2),
                child: ElevatedButton(
                  child: Text(
                    'Search',
                    style: Textstyle.whitebold18,
                  ),
                  onPressed: () {
                    Modelrandow.area = area.text.toString().isEmpty
                        ? 'Dhamondi'
                        : area.text.toString();
                    Modelrandow.bloodgrope = bloodgropeselected.value;
                    Modelrandow.location = location.text.toString();
                    Get.to(() => SearchViewUI());
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuerypage.safeBlockHorizontal! * 5,
                          vertical: MediaQuerypage.safeBlockVertical! * 1.0),
                      textStyle: TextStyle(
                          fontSize: MediaQuerypage.fontsize! * 18,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuerypage.safeBlockVertical! * 1),
                child: ElevatedButton(
                  child: Text(
                    'Cancel',
                     style: Textstyle.whitebold18,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueGrey,
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuerypage.safeBlockHorizontal! * 5,
                        vertical: MediaQuerypage.safeBlockVertical! * 1.2),
                    textStyle: TextStyle(
                      fontSize: MediaQuerypage.fontsize! * 18,
                      color: AppColor.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
