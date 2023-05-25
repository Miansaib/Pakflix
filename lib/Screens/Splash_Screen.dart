import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled2/Screens/Dashboard_Screen.dart';
import 'package:untitled2/Screens/signin_screen.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SplashScreen> {
  @override
  void initState() {
    //set time to load the new page
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'Assets/PNG/PakFlix_Logo.png',
              width: 150,
              height: 150,
            ),
          ],
        ),
      ),
    );
  }
  void startTimer() {
    Timer(const Duration(seconds: 3), () {
      navigateUser(); //It will redirect  after 3 seconds
    });
  }
  void navigateUser() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var status = prefs.getBool('isLoggedIn') ?? false;
    if (kDebugMode) {
      print(status);
    }
    if (status) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (ctx) {
          return const DashboardScreen();
        }),
      );
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (ctx) {
          return const SignInScreen();
        }),
      );
    }
  }
}
