import 'package:blood_donation_collage/helper/callingname.dart';
import 'package:blood_donation_collage/screen/registation/model/model_Userinformation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Stroage {
  Future<bool?> userloginorNot() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? ans = prefs.getBool('isLoggedIn') ?? false;
    if (ans) {
      //**if already user login  */
      UserInformation.userId = prefs.getString(CallingName.user_id)!;
    }
    return ans;
  }

  set_userlogin(String userID) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //**for first login user id stroe in database  */
    prefs.setString(CallingName.user_id, userID);
    prefs.setBool(CallingName.loginstatus, true);
  }

  cleanstroage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //**for first login user id stroe in database  */
    await prefs.clear();
  }
}
