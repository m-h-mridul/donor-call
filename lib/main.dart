// ignore_for_file: prefer_const_constructors, unused_element
import 'package:blood_donation_collage/view/screen/ambulancebookingui.dart';
import 'package:blood_donation_collage/view/screen/ambulanceui.dart';
import 'package:blood_donation_collage/view/screen/bloodbankui.dart';
import 'package:blood_donation_collage/view/screen/Dashboard.dart';
import 'package:blood_donation_collage/view/screen/DoctorUI.dart';
import 'package:blood_donation_collage/view/screen/healthwebview.dart';
import 'package:blood_donation_collage/view/screen/home.dart';
import 'package:blood_donation_collage/view/screen/hosipitalemergecy.dart';
import 'package:blood_donation_collage/view/screen/log-in.dart';
import 'package:blood_donation_collage/view/screen/notfificationUI.dart';
import 'package:blood_donation_collage/view/screen/pageviewr.dart';
import 'package:blood_donation_collage/view/screen/Registation.dart';
import 'package:blood_donation_collage/view/screen/request.dart';
import 'package:blood_donation_collage/view/screen/resetPassword.dart';
import 'package:blood_donation_collage/view/screen/splash_screen.dart';
import 'package:blood_donation_collage/stroage/stroage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/route_manager.dart';
import 'view/screen/DonarRequest.dart';
import 'view/screen/forgetui.dart';
import 'view/screen/myrequestview.dart';
import 'view/screen/Search.dart';

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
