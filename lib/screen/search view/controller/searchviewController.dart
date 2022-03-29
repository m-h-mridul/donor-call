import 'package:blood_donation_collage/helper/callingname.dart';
import 'package:blood_donation_collage/screen/search%20view/model/randomModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:get/state_manager.dart';
import '../../registation/model/model_Userinformation.dart';
import '../model/searchviewModel.dart';

class SearchViewController extends GetxController {
  RxList<SearchViewModel> requestlist = RxList<SearchViewModel>();
  RxString dpUrl = ''.obs;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  FirebaseStorage storage = FirebaseStorage.instance;

  @override
  void onInit() {
    requestlist.bindStream(getrequestList());
    super.onInit();
  }

  void getdpImage(String uid) async {
    try {
      dpUrl.value = await storage.ref(uid + 'user_image').getDownloadURL();
    } catch (e) {
      if ('[firebase_storage/object-not-found]' == e.toString()) {
        debugPrint('User cannot upload dp');
      }
      debugPrint('Error finding in image get method');
      debugPrint(' errors is ${e.toString()}');
    }
  }

  Stream<List<SearchViewModel>> getrequestList() => users
          .where(CallingName.bloodgrope, isEqualTo: Modelrandow.bloodgrope)
          .snapshots()
          .asyncMap((event) {
        List<SearchViewModel> ll = [];
        print(event.docs);
        for (var element in event.docs) {
          if (element.get(CallingName.user_id) != UserInformation.userId) {
            ll.add(SearchViewModel(
              bloodGrope: element.get(CallingName.bloodgrope),
              location: element.get(CallingName.location),
              mobile: element.get(CallingName.mobile),
              name: element.get(CallingName.name),
              user_uid: element.get(CallingName.user_id),
            ));
          }
        }
        return ll;
      });
}
