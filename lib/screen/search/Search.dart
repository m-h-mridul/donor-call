// ignore_for_file: override_on_non_overriding_member, prefer_const_constructors, must_be_immutable

import 'package:blood_donation_collage/design/appcolor.dart';
import 'package:blood_donation_collage/design/media_query.dart';
import 'package:blood_donation_collage/screen/registation/model/model_Userinformation.dart';
import 'package:blood_donation_collage/screen/search/controller/SearchController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../design/Textstyle.dart';
import '../registation/model/bloodmodel.dart';
import '../search view/model/randomModel.dart';
import '../search view/view/searchview.dart';

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
                    Modelrandow.area = area.text.toString().isEmpty?'Dhamondi':area.text.toString();
                    Modelrandow.bloodgrope = bloodgropeselected.value;
                    Modelrandow.location = location.text.toString();
                    Get.to(() => SearchViewUI());
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuerypage.safeBlockHorizontal! * 8,
                          vertical: MediaQuerypage.safeBlockVertical! * 1.5),
                      textStyle:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuerypage.safeBlockVertical! * 2),
                child: ElevatedButton(
                  child: Text(
                    'Cancel',
                    style: Textstyle.black18,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuerypage.safeBlockHorizontal! * 8,
                          vertical: MediaQuerypage.safeBlockVertical! * 1.5),
                      textStyle:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
