import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/Models/movie_model.dart';
import '../Custom Widgets/Bottum_Nav_Bar.dart';
import '../Services/AdMob_Helper.dart';
import 'Movie_Discription_Screen.dart';
import 'Profile_Screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

CollectionReference movies = FirebaseFirestore.instance.collection('Movies');

AdmobHelper admobHelper = AdmobHelper();
late final DateTime Date = DateTime.utc(2020, 5, 7, 2, 7);

class _DashboardScreenState extends State<DashboardScreen> {
  late Timer timerForInter;

  @override
  void initState() {
    // Add these lines to launch timer on start of the app
    timerForInter = Timer.periodic(const Duration(seconds: 60 * 5), (result) {
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
      backgroundColor: Colors.grey.shade800,
      appBar: AppBar(
        title: const Text(
          'Dashboard',
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream:
                  FirebaseFirestore.instance.collection('Movies').snapshots(),
              builder: (_, snapshot) {
                if (snapshot.hasData) {
                  final docs = snapshot.data!.docs;
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        index + 10;
                        final data = docs[index].data();
                        Movie obj = Movie.fromSnapshot(data);

                        return Container(
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(16)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              imageUrl: obj.poster!,
                              placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                        );
                      },
                      itemCount: 10,
                      viewportFraction: 0.8,
                      scale: 0.9,
                    ),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Movies',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                        color: Colors.white),
                  )),
            ),
            SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.25,
                child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: FirebaseFirestore.instance
                      .collection('Movies')
                      .snapshots(),
                  builder: (_, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error = ${snapshot.error}');
                    }

                    if (snapshot.hasData) {
                      final docs = snapshot.data!.docs;
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 150,
                        itemBuilder: (_, i) {
                          i = i + 20;
                          final data = docs[i].data();

                          return InkWell(
                            onTap: () {
                              admobHelper.createInterad();
                              admobHelper.showInterad();
                              Movie obj = Movie.fromSnapshot(data);
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (ctx) {
                                  return MovieDiscriptionScreen(
                                    obj,
                                    Movie: obj,
                                  );
                                }),
                              );
                            },
                            child: Stack(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  height:
                                      MediaQuery.of(context).size.height * 1,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(16)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: data['Poster'] == null
                                        ? Image.asset(
                                            'Assets/JPG/Captain-america-1.jpg',
                                            fit: BoxFit.cover,
                                          )
                                        : CachedNetworkImage(
                                            imageUrl: data['Poster'],
                                            placeholder: (context, url) =>
                                                const Center(
                                                    child:
                                                        CircularProgressIndicator()),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
                                          ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 0, 0, 20),
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  height:
                                      MediaQuery.of(context).size.height * 1,
                                  child: Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        data['Title'],
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 13),
                                      )),
                                ),
                              )
                            ]),
                          );
                        },
                      );
                    }

                    return const Center(child: CircularProgressIndicator());
                  },
                )),
          ],
        ),
      ),
      bottomNavigationBar: const BottunNavBar(),
    );
  }
}
