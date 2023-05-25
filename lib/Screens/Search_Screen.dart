import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../Custom Widgets/Bottum_Nav_Bar.dart';
import '../Models/movie_model.dart';
import 'Dashboard_Screen.dart';
import 'Movie_Discription_Screen.dart';
import 'Profile_Screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  late Timer timerForInter;
  List<dynamic> alldata = [];

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


  String Name = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      appBar: AppBar(
        title: const Text('Search', style: TextStyle(color: Colors.white),),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(

                onSubmitted: (s) {
                  if (kDebugMode) {
                    print(s);
                  }
                },
                style: const TextStyle(color: Colors.white, fontSize: 20),
                onChanged: (val) {
                  setState(() {
                    Name = val;
                  });
                },
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.search),
                    color: Colors.white,
                  ),
                  labelText: 'Search Movie',
                  labelStyle:
                  const TextStyle(color: Colors.white, fontSize: 16),
                  hintText: 'Search',
                  hintStyle: const TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(23),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: Colors.white, width: 3),
                    borderRadius: BorderRadius.circular(23),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30,),
            SizedBox(
              height: size.width,
              width: size.height,
              // child: StreamBuilder<QuerySnapshot>(
              //     stream: (Name != "" && Name != null) ? FirebaseFirestore
              //         .instance.collection('Movies').where(
              //         'search', arrayContains: Name).snapshots() :
              //     FirebaseFirestore.instance.collection('Movies').snapshots(),
              //     builder: (context, snapshot) {
              //       final docs = snapshot.data!.docs;
              //       return (snapshot.connectionState == ConnectionState.waiting)
              //           ? const Center(
              //         child: CircularProgressIndicator(),
              //       ) : ListView.builder(
              //           itemCount: docs.length,
              //           itemBuilder: (_,index){
              //             final data =snapshot.data!.docs[index];
              //             Movie obj = Movie.fromSnapshot(data[index]);
              //             return Padding(
              //               padding: const EdgeInsets.only(left: 20,right: 20,bottom: 8,top: 8),
              //               child: InkWell(
              //                 onTap: () {
              //
              //                   Navigator.of(context).push(
              //                     MaterialPageRoute(builder: (ctx) {
              //                       return MovieDiscriptionScreen(obj,Movie: obj,);
              //                     }),
              //                   );
              //                 },
              //                 child: Row(children: [
              //                   Container(
              //                     width:size.height*0.1,
              //                     height:size.width*0.3,
              //                     decoration: BoxDecoration(
              //                         color: Colors.grey,
              //                         borderRadius: BorderRadius.circular(16)),
              //                     child: ClipRRect(
              //                       borderRadius: BorderRadius.circular(16),
              //                       child: data['Poster'] == null
              //                           ? Image.asset(
              //                         'Assets/JPG/Captain-america-1.jpg',
              //                         fit: BoxFit.cover,
              //                       )
              //                           : CachedNetworkImage(
              //                         imageUrl:  data['Poster'],
              //                         placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
              //                         errorWidget: (context, url, error) => const Icon(Icons.error),
              //                       ),
              //                     ),
              //                   ),
              //                   Padding(
              //                     padding:
              //                     const EdgeInsets.fromLTRB(20, 0, 0, 20),
              //                     child: Align(
              //                         alignment: Alignment.bottomLeft,
              //                         child: Text(
              //                           data['Title'],
              //                           style: const TextStyle(
              //                               color: Colors.white, fontSize: 13),
              //                         )),
              //                   )
              //                 ]),
              //               ),
              //             );
              //           });
              //     }
              // ),
                child:StreamBuilder<QuerySnapshot>(
                  stream: (Name != "" && Name != null)
                      ? FirebaseFirestore.instance
                      .collection('Movies')
                      .where('search', arrayContains: Name)
                      .snapshots()
                      : FirebaseFirestore.instance.collection('Movies').snapshots(),
                  builder: (context, snapshot) {
                    final docs = snapshot.data!.docs;
                    return (snapshot.connectionState == ConnectionState.waiting)
                        ? const Center(
                      child: CircularProgressIndicator(),
                    )
                        : ListView.builder(
                        itemCount: docs.length,
                        itemBuilder: (_, index) {
                          final data = docs[index].data() as Map<String,dynamic>;
                          //final data = snapshot.data!.docs[index];
                          Movie obj = Movie.fromSnapshot(data);
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 8, top: 8),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (ctx) {
                                    return MovieDiscriptionScreen(
                                      obj,
                                      Movie: obj,
                                    );
                                  }),
                                );
                              },
                              child: Row(children: [
                                Container(
                                  width: size.height * 0.1,
                                  height: size.width * 0.3,
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
                                      errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 20),
                                  child: Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        data['Title'],
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 13),
                                      )),
                                )
                              ]),
                            ),
                          );
                        });
                  },
                )

            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottunNavBar(),
    );
  }
}


