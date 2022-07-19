// ignore_for_file: non_constant_identifier_names, void_checks, prefer_typing_uninitialized_variables

import 'package:blood_donation_collage/helper/callingname.dart';
import 'package:blood_donation_collage/model/model_Userinformation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/state_manager.dart';

class SearchController extends GetxController {
  RxList<UserInformation> userList = RxList<UserInformation>();
  Search_BloodGrope(String bloodgrope, String location) {
    userList.bindStream(FirebaseFirestore.instance
        .collection(CallingName.user_collectionName)
        .where(CallingName.bloodgrope, isEqualTo: bloodgrope)
        .snapshots()
        .asyncMap((event) {
      List<UserInformation> data = [];
      for (var element in event.docs) {
        data.add(UserInformation(
          age: element.get(CallingName.age),
          name: element.get(CallingName.name),
          mobile: element.get(CallingName.mobile),
          blood_grope: element.get(CallingName.bloodgrope),
          location: element.get(CallingName.location),
        ));

        print(element.get(CallingName.name));
      }
      return data;
    }));
  }
}
