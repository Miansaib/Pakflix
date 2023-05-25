import 'dart:async';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../Custom Widgets/Bottum_Nav_Bar.dart';
import 'Dashboard_Screen.dart';
import 'Profile_Screen.dart';
class TalkShowScreen extends StatefulWidget {
  const TalkShowScreen({Key? key}) : super(key: key);
  @override
  State<TalkShowScreen> createState() => _TalkShowScreenState();
}
class _TalkShowScreenState extends State<TalkShowScreen> {
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
        title: const Text('Talk Shows',style: TextStyle(color:Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.grey[800],
        leading: InkWell(
          onTap: (){
          },
          child: const Icon(
            Icons.menu,
            size: 30,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx) {
                return const ProfileScreen();
              }),
            );},
            icon: const Icon(
              Icons.account_circle_rounded,
              size: 30,
              color: Colors.white,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade800,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            Center(
              child: Lottie.asset('Assets/Lottie_Files/14429-tv.json',
                  height: MediaQuery.of(context).size.height * 0.3),
            ),
            const SizedBox(height: 15,),
            SizedBox(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.3,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(16)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        'Assets/JPG/Captain-america-1.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                itemCount: 10,
                viewportFraction: 0.8,
                scale: 0.9,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Talk Show',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white),
                  )),
            ),
            SizedBox(
              width: double.infinity,
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.25,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.3,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(16)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          'Assets/JPG/Captain-america-1.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.3,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(16)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          'Assets/JPG/Captain-america-1.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.3,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(16)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          'Assets/JPG/Captain-america-1.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.3,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(16)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          'Assets/JPG/Captain-america-1.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.3,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(16)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          'Assets/JPG/Captain-america-1.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Favorate',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white),
                  )),
            ),
            SizedBox(
              width: double.infinity,
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.25,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.3,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(16)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          'Assets/JPG/Captain-america-1.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.3,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(16)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          'Assets/JPG/Captain-america-1.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.3,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(16)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          'Assets/JPG/Captain-america-1.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.3,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(16)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          'Assets/JPG/Captain-america-1.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.3,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(16)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          'Assets/JPG/Captain-america-1.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottunNavBar(),
    );
  }
}
