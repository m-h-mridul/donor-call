// ignore_for_file: file_names

import 'package:blood_donation_collage/helper/callingname.dart'
    show CallingName;
import 'package:blood_donation_collage/model/donerrequestmodel.dart';
import 'package:blood_donation_collage/model/model_Userinformation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class MyRequestController extends GetxController {
  RxList<DonerRqequest_model> requestlist = RxList<DonerRqequest_model>();
  CollectionReference users =
      FirebaseFirestore.instance.collection(CallingName.Donate_request);
  @override
  void onInit() {
    requestlist.bindStream(getrequestList());
    super.onInit();
  }

  Stream<List<DonerRqequest_model>> getrequestList() => users
          .orderBy(CallingName.time, descending: true)
          .snapshots()
          .asyncMap((event) {
        // print('request blood name ');
        List<DonerRqequest_model> ll = [];
        for (var element in event.docs) {
          //print( 'doner request id '+element.id);
          if (element.get(CallingName.user_id) == UserInformation.userId) {
            ll.add(DonerRqequest_model(
              request_id: element.id,
              bloodgrope: element.get(CallingName.bloodgrope),
              location: element.get(CallingName.location),
              mobile: element.get(CallingName.mobile),
              hospital: element.get(CallingName.hospital_name),
              notes: element.get(CallingName.notes),
              date: element.get(CallingName.date) ?? 'Not set',
            ));
          }
        }
        return ll;
      });
}
