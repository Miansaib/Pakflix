import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled2/Screens/Dashboard_Screen.dart';
import 'Screens/signin_screen.dart';
import 'Services/AdMob_Helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  MobileAds.instance.initialize();
  AdmobHelper.initialization();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var status = prefs.getBool('isLoggedIn') ?? false;
  runApp(MaterialApp(
    home: status == true ? const DashboardScreen() : const SignInScreen(),
    debugShowCheckedModeBanner: false,
    title: 'PakFlix',
  ));
}