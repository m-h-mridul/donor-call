// ignore_for_file: override_on_non_overriding_member, prefer_const_constructors, must_be_immutable

import 'package:blood_donation_collage/resource/Textstyle.dart';
import 'package:blood_donation_collage/resource/appcolor.dart';
import 'package:blood_donation_collage/resource/media_query.dart';
import 'package:blood_donation_collage/model/bloodmodel.dart';
import 'package:blood_donation_collage/view/screen/Successful.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/route_manager.dart';
import '../../controller/requestCOntroller.dart';
import '../../model/requestmodel.dart';

class Request extends StatelessWidget {
  Request({Key? key}) : super(key: key);
  static const name = 'request';
  //**
  //*variable
  // */
  TextEditingController location = TextEditingController();
  TextEditingController hospital = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController notes = TextEditingController();
  RequestController requestcontroller = Get.put(RequestController());
  RxString bloodgropeselected = ''.obs;
  TextEditingController date2 =
      TextEditingController(text: DateTime.now().toString());

  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    date2 = TextEditingController(text: DateTime.now().toString());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          elevation: 1,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'Request for blood',
            style: Textstyle.black,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuerypage.safeBlockHorizontal! * 3,
                vertical: MediaQuerypage.safeBlockVertical! * 2),
            child: Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                  SizedBox(
                    height: MediaQuerypage.screenHeight! * 0.02,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.words,
                    textInputAction: TextInputAction.next,
                    controller: location,
                    validator: (_) {
                      if (location.text.toString().isEmpty) {
                        return 'Enter your location';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: AppColor.grey_textFiled,
                        prefixIcon: Icon(
                          Icons.location_on,
                          color: AppColor.red_appcolor,
                        ),
                        hintText: 'location',
                        hintStyle: Textstyle.red16),
                  ),
                  SizedBox(
                    height: MediaQuerypage.screenHeight! * 0.01,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    textCapitalization: TextCapitalization.words,
                    controller: hospital,
                    validator: (_) {
                      if (location.text.toString().isEmpty) {
                        return 'Hospital name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: AppColor.grey_textFiled,
                        prefixIcon: Icon(
                          Icons.local_hospital,
                          color: AppColor.red_appcolor,
                        ),
                        hintText: 'Hospital Name',
                        hintStyle: Textstyle.red16),
                  ),
                  SizedBox(
                    height: MediaQuerypage.screenHeight! * 0.01,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    controller: phone,
                    validator: (_) {
                      if (location.text.toString().isEmpty) {
                        return 'Phone Number';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: AppColor.grey_textFiled,
                        prefixIcon: Icon(
                          Icons.call,
                          color: AppColor.red_appcolor,
                        ),
                        hintText: 'Phone',
                        hintStyle: Textstyle.red16),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: MediaQuerypage.safeBlockVertical! * 2,
                      horizontal: MediaQuerypage.safeBlockHorizontal! * 3,
                    ),
                    child: DateTimePicker(
                      type: DateTimePickerType.date,
                      dateMask: 'd MMM, yyyy',
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                      controller: date2,
                      icon: Icon(Icons.event),
                      dateLabelText: 'Date',
                      timeLabelText: "Hour",
                      selectableDayPredicate: (date) {
                        // Disable weekend days to select from the calendar
                        if (date.weekday == 6 || date.weekday == 7) {
                          return false;
                        }
                        return true;
                      },
                      onChanged: (val) => print(val),
                      validator: (val) {
                        print(val);
                        return null;
                      },
                      onSaved: (val) => date2.value != val,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuerypage.screenHeight! * 0.01,
                  ),
                  SizedBox(
                    height: MediaQuerypage.screenHeight! * 0.2,
                    child: TextFormField(
                      textAlignVertical: TextAlignVertical.top,
                      textCapitalization: TextCapitalization.sentences,
                      expands: true,
                      maxLines: null,
                      minLines: null,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      controller: notes,
                      validator: (_) {
                        if (notes.text.toString().isEmpty) {
                          return "Enter Patient Details";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: AppColor.grey_textFiled,
                          // prefixIcon: Icon(
                          //   Icons.note_add,
                          //   color: AppColor.red_appcolor,
                          // ),
                          hintText: 'Patient details',
                          hintStyle: Textstyle.red16),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuerypage.screenHeight! * 0.07,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () async {
                          print(date2.text.toString());
                          RequestModel model = RequestModel(
                            hospital: hospital.text.toString(),
                            location: location.text.toString(),
                            mobile: phone.text.toString(),
                            blodtypes: bloodgropeselected.value.toString(),
                            notes: notes.text.toString(),
                            date: date2.text.toString(),
                          );
                          await requestcontroller.requestSent(model);
                          // String code = await requestcontroller.requestSent(model);
                          // print('Reuest add firbase' + code);
                          Get.to(() => Successfull('Request Done'));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          child: Text('Request', style: Textstyle.whitebold18),
                          width: MediaQuerypage.screenWidth! * 0.3,
                          height: MediaQuerypage.screenHeight! * 0.055,
                          decoration: BoxDecoration(
                              color: Colors.black,

                              //AppColor.red_appcolor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7))),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: MediaQuerypage.safeBlockVertical! * 2),
                        child: ElevatedButton(
                          child: Text(
                            'Cancel',
                            style: Textstyle.whitebold18,
                          ),
                          onPressed: () {
                            Get.back();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: AppColor.bluegray,
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuerypage.safeBlockHorizontal! * 5,
                                vertical:
                                    MediaQuerypage.safeBlockVertical! * 1.1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
