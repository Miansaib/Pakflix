import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled2/Screens/signin_screen.dart';
import 'Dashboard_Screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  late String UserName='';
  late String Email='';
  late String PhoneNumber='';
  getData() async{
    final firebaseUser = await FirebaseAuth.instance.currentUser!;
    if (firebaseUser != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser.uid)
          .get()
          .then((ds) {
        Email = ds.data()!['Email'];
        if (kDebugMode) {
          print(Email);
        }

        UserName = ds.data()!['User Name'];

        PhoneNumber = ds.data()!['Phone Number'];
      }).catchError((e) {
        if (kDebugMode) {
          print(e);
        }
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    late Timer timerForInter;
    @override
    void initState() {
      getData();
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
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      body: Column(children: [
        const SizedBox(
          height: 35,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) {
                      return const DashboardScreen();
                    }),
                  );
                },
                child: Container(
                  height: 33,
                  width: 33,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey.shade300,
                  ),
                  child: const Icon(Icons.keyboard_backspace),
                ),
              ),
            ),
            SizedBox(
              width: size.width * 0.25,
            ),
            const Text(
              'My Profile',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(child:
                CircularProgressIndicator(),);
            }
            return Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: size.width * 0.85,
                  height: 44,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.green,
                  ),
                  child: Row(
                    children:  [
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.account_circle_sharp,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        UserName,
                        style: const TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: 44,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.green,
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          Email,
                          style: const TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: 44,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.green,
                  ),
                  child: Row(
                    children:  [
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        PhoneNumber,
                        style: const TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
              ],
            );
          },
        ),
      ]),
      bottomNavigationBar: InkWell(
        onTap: () {
          logoutUser();
          Navigator.of(context).push(
            MaterialPageRoute(builder: (ctx) {
              return const SignInScreen();
            }),
          );
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.85,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.shade200,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.logout,
                  color: Colors.green,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Logout',
                  style: TextStyle(fontSize: 18, color: Colors.green),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<void> logoutUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
