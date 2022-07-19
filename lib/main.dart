// ignore_for_file: prefer_const_constructors, unused_element
import 'package:blood_donation_collage/screen/ambulance%20booking/view/ambulancebookingui.dart';
import 'package:blood_donation_collage/screen/ambulance/view/ambulanceui.dart';
import 'package:blood_donation_collage/screen/blood%20bank/view/bloodbankui.dart';
import 'package:blood_donation_collage/screen/dashboard/Dashboard.dart';
import 'package:blood_donation_collage/screen/doctor/view/DoctorUI.dart';
import 'package:blood_donation_collage/screen/health%20news/healthwebview.dart';
import 'package:blood_donation_collage/screen/home/home.dart';
import 'package:blood_donation_collage/screen/hospital%20emergency/view/hosipitalemergecy.dart';
import 'package:blood_donation_collage/screen/log-in/log-in.dart';
import 'package:blood_donation_collage/screen/notification/view/notfificationUI.dart';
import 'package:blood_donation_collage/screen/pageview/view/pageviewr.dart';
import 'package:blood_donation_collage/screen/registation/Registation.dart';
import 'package:blood_donation_collage/screen/request%20make/request.dart';
import 'package:blood_donation_collage/screen/reset%20password/resetPassword.dart';
import 'package:blood_donation_collage/screen/splashscreen/splash_screen.dart';
import 'package:blood_donation_collage/stroage/stroage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/route_manager.dart';
import 'screen/Donar request view/DonarRequest.dart';
import 'screen/forget password/view/forgetui.dart';
import 'screen/my request view/view/myrequestview.dart';
import 'screen/search/Search.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('A bg message just showed up :  ${message.messageId}');
}

bool? ans;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, // navigation bar color
      statusBarColor: Color(0xFFFF2156),
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark // status bar color
      ));

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  await Firebase.initializeApp();
  //**for massegiing  */
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  //**cheak user already log in or not */
  Stroage memory = Stroage();
  ans = await memory.userloginorNot();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.grey),
        initialRoute: SplashScreen.name,
        routes: {
          HospitalEmergncy.name: (context) => HospitalEmergncy(),
          SplashScreen.name: (context) => SplashScreen(ans),
          Pagevier.name: (context) => Pagevier(),
          Home.name: (conetex) => Home(),
          Login.name: (context) => Login(),
          Registation.name: (context) => Registation(),
          ResetPassword.name: (context) => ResetPassword(),
          Dashboard.name: (context) => Dashboard(),
          Request.name: (context) => Request(),
          WebViewExample.name: (context) => WebViewExample(),
          AmbulanceUI.name: (context) => AmbulanceUI(),
          AmbulnceBookingUI.name: (context) => AmbulnceBookingUI(),
          BloodBankView.name: (context) => BloodBankView(),
          DoctorUI.name: (context) => DoctorUI(),
          DonarRequest_View.name: (context) => DonarRequest_View(),
          MyRequest_View.name: (context) => MyRequest_View(),
          Search.name: (context) => Search(),
          ForgetPasswordUI.name: (context) => ForgetPasswordUI(),
          NotificationUI.name: (context) => NotificationUI()
        });
  }
}
