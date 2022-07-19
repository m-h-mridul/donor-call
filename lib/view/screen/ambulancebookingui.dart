// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:blood_donation_collage/resource/Textstyle.dart';
import 'package:blood_donation_collage/resource/appcolor.dart';
import 'package:blood_donation_collage/view/screen/Successful.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../resource/media_query.dart';

class AmbulnceBookingUI extends StatelessWidget {
  static const name = 'AmbulnceBookingUI';
  AmbulnceBookingUI({Key? key}) : super(key: key);
  TextEditingController fullName = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController mobile_number = TextEditingController();
  TextEditingController hospital_Name = TextEditingController();
  TextEditingController date_time =
      TextEditingController(text: DateTime.now().toString());
  RxString foos = 'Selected Ambulance Types'.obs;
  UniqueKey uniqueKey = UniqueKey();
  RxBool expansionTile = false.obs;
//Ambulance Type *
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuerypage.safeBlockVertical! * 3,
                horizontal: MediaQuerypage.safeBlockHorizontal! * 3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuerypage.safeBlockVertical! * 1.5,
                  ),
                  child: Center(
                    child: Text(
                      'Reserve An Ambulance Today',
                      style: Textstyle.redbold24,
                    ),
                  ),
                ),
                Text(
                  '''If You Need An Ambulance Quickly. Don't Submit This Form. Just Call Us.''',
                  style: Textstyle.black16,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: MediaQuerypage.screenHeight! * 0.02,
                ),
                Text(
                  'Your Full Name *',
                  style: Textstyle.blackbold16,
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: mobile_number,
                  validator: (_) {
                    // if (phone.text.toString().isEmpty) {
                    //   return 'Enter Mobile Number';
                    // }
                    return null;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius:
                            BorderRadius.circular(MediaQuerypage.pixel! * 6),
                      ),
                      filled: true,
                      fillColor: AppColor.grey_textFiled,
                      prefixIcon: Icon(
                        Icons.perm_identity,
                        color: AppColor.red_appcolor,
                      ),
                      hintText: 'Full Name '),
                ),
                SizedBox(
                  height: MediaQuerypage.screenHeight! * 0.02,
                ),
                Text(
                  'Your Phone *',
                  style: Textstyle.blackbold16,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: mobile_number,
                  validator: (_) {
                    // if (phone.text.toString().isEmpty) {
                    //   return 'Enter Mobile Number';
                    // }
                    return null;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius:
                            BorderRadius.circular(MediaQuerypage.pixel! * 6),
                      ),
                      filled: true,
                      fillColor: AppColor.grey_textFiled,
                      prefixIcon: Icon(
                        Icons.call,
                        color: AppColor.red_appcolor,
                      ),
                      hintText: 'Phone'),
                ),
                SizedBox(
                  height: MediaQuerypage.screenHeight! * 0.02,
                ),
                Text(
                  'Hospital Name *',
                  style: Textstyle.blackbold16,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: mobile_number,
                  validator: (_) {
                    // if (phone.text.toString().isEmpty) {
                    //   return 'Enter Mobile Number';
                    // }
                    return null;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius:
                            BorderRadius.circular(MediaQuerypage.pixel! * 6),
                      ),
                      filled: true,
                      fillColor: AppColor.grey_textFiled,
                      prefixIcon: Icon(
                        Icons.local_hospital,
                        color: AppColor.red_appcolor,
                      ),
                      hintText: 'Hospital Name'),
                ),
                SizedBox(
                  height: MediaQuerypage.screenHeight! * 0.02,
                ),
                Text(
                  'Enter Your Address *',
                  style: Textstyle.blackbold16,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: mobile_number,
                  validator: (_) {
                    // if (phone.text.toString().isEmpty) {
                    //   return 'Enter Mobile Number';
                    // }
                    return null;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius:
                            BorderRadius.circular(MediaQuerypage.pixel! * 6),
                      ),
                      filled: true,
                      fillColor: AppColor.grey_textFiled,
                      prefixIcon: Icon(
                        Icons.share_location,
                        color: AppColor.red_appcolor,
                      ),
                      hintText: 'Address'),
                ),
                SizedBox(
                  height: MediaQuerypage.screenHeight! * 0.02,
                ),
                DateTimePicker(
                  type: DateTimePickerType.dateTimeSeparate,
                  dateMask: 'd MMM, yyyy',
                  controller: date_time,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  use24HourFormat: false,
                  icon: const Icon(Icons.event),
                  dateLabelText: 'Date',
                  timeLabelText: "Time",
                  selectableDayPredicate: (date) {
                    if (date.weekday == 6 || date.weekday == 7) {
                      return false;
                    }
                    return true;
                  },
                  validator: (val) {
                    //print(val);
                    return 'Enter date and time';
                  },
                ),
                SizedBox(
                  height: MediaQuerypage.screenHeight! * 0.02,
                ),

                //**
                //*selected types of ambulance
                // */
                Text(
                  'Ambulance Type *',
                  style: Textstyle.blackbold16,
                ),
                Obx(
                  () => Card(
                    child: ExpansionTile(
                      key: uniqueKey,
                      initiallyExpanded: expansionTile.value,
                      //maintainState: expansionTile.value,
                      title: Text(foos.value),
                      children: <Widget>[
                        ListTile(
                          title: const Text('ICU AMBULANCE'),
                          onTap: () {
                            foos.value = 'ICU AMBULANCE';
                            expansionTile.value = false;
                            uniqueKey = UniqueKey();
                          },
                        ),
                        ListTile(
                          title: const Text('HIACE AMBULANCE AC'),
                          onTap: () {
                            foos.value = 'HIACE AMBULANCE AC';
                            expansionTile.value = false;
                            uniqueKey = UniqueKey();
                          },
                        ),
                        ListTile(
                          title: const Text('FREEZER VAN'),
                          onTap: () {
                            foos.value = 'FREEZER VAN';
                            expansionTile.value = false;
                            uniqueKey = UniqueKey();
                          },
                        ),
                        ListTile(
                          title: const Text('HIACE AMBULANCE Non AC'),
                          onTap: () {
                            foos.value = 'HIACE AMBULANCE Non AC';
                            expansionTile.value = false;
                            uniqueKey = UniqueKey();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuerypage.safeBlockVertical! * 3,
                      horizontal: MediaQuerypage.safeBlockHorizontal! * 2),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => Successfull('Booking Done'));
                    },
                    child: Text('Book Now', style: Textstyle.whitebold16),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuerypage.safeBlockVertical! * 1.5,
                          horizontal: MediaQuerypage.safeBlockHorizontal! * 3),
                      textStyle: Textstyle.whitebold16,
                      primary: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
