// ignore_for_file: equal_keys_in_map, file_names, unused_catch_clause

import 'package:blood_donation_collage/helper/callingname.dart';
import 'package:blood_donation_collage/screen/registation/model/model_Userinformation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../model/requestmodel.dart';


class RequestController extends GetxController {
  requestSent(RequestModel m) async {
    // print('Requesent sent');
    String code = 'Not Done';
    try {
      await FirebaseFirestore.instance
          .collection(CallingName.Donate_request)
          .add({
        CallingName.bloodgrope: m.blodtypes!.toUpperCase(),
        CallingName.location: m.location,
        CallingName.user_id: UserInformation.userId,
        CallingName.mobile: m.mobile,
        CallingName.notes: m.notes,
        CallingName.hospital_name: m.hospital,
        CallingName.date:m.date,
        CallingName.time: DateFormat("hh:mm:ss a").format(DateTime.now()),
      }).whenComplete(() {
        code = ' Request Done ';
      });
      // **increase user request
      await FirebaseFirestore.instance
          .collection('users')
          .doc(UserInformation.userId)
          .update({CallingName.request: FieldValue.increment(1)});
    } on FirebaseException catch (e) {
      // print('Error in firebase ' + e.toString());
    } catch (e) {
      // print('Error in others ' + e.toString());
    }

    return code;
  }
}
