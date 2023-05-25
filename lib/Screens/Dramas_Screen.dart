import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../Custom Widgets/Bottum_Nav_Bar.dart';
import 'Dashboard_Screen.dart';
import 'Profile_Screen.dart';

class DramaScreen extends StatefulWidget {
  const DramaScreen({Key? key}) : super(key: key);

  @override
  State<DramaScreen> createState() => _DramaScreenState();
}

class _DramaScreenState extends State<DramaScreen> {
  late Timer timerForInter;

  @override
  void initState() {
    // Add these lines to launch timer on start of the app
    timerForInter = Timer.periodic(const Duration(seconds: 60*5), (result) {
      admobHelper.createInterad();
      admobHelper.showInterad();
    });
    super.initState();
  }

  @override
  void dispose() {
    // Add these to dispose to cancel timer when user leaves the app
    timerForInter.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dramas',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[800],
        leading: InkWell(
          onTap: () {},
          child: const Icon(
            Icons.menu,
            size: 30,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx) {
                  return const ProfileScreen();
                }),
              );
            },
            icon: const Icon(
              Icons.account_circle_rounded,
              size: 30,
              color: Colors.white,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade800,
      body: Center(
          child: Lottie.asset('Assets/Lottie_Files/2326-coming-soon.json')),
      bottomNavigationBar: const BottunNavBar(),
    );
  }
}
