import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:untitled2/Models/movie_model.dart';
import 'package:untitled2/Screens/Dashboard_Screen.dart';
import '../Custom Widgets/fijkPlayer.dart';

class MovieDiscriptionScreen extends StatefulWidget {
  // ignore: avoid_types_as_parameter_names
  MovieDiscriptionScreen(this.myObj, {super.key, required Movie});

  Movie myObj;

  @override
  State<MovieDiscriptionScreen> createState() => _MovieDiscriptionScreenState();
}

class _MovieDiscriptionScreenState extends State<MovieDiscriptionScreen> {
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
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Container(
      height: size.height * 10,
      width: size.width * 10,
      color: Colors.grey.shade800,
      child: Stack(
        children: [
          Image.network(
            widget.myObj.poster == null
                ? 'https://cdn.britannica.com/30/182830-050-96F2ED76/Chris-Evans-title-character-Joe-Johnston-Captain.jpg'
                : widget.myObj.poster!,
            height: size.height * 0.50,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: size.height * 0.05,
            left: size.width * 0.05,
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
                  color: Colors.grey.shade300.withOpacity(0.6),
                ),
                child: const Icon(
                  Icons.keyboard_backspace,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.2,
            left: size.width * 0.45,
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) {
                    return VideoScreen(
                      url: widget.myObj.url!,
                      title: widget.myObj.title!,
                    );
                  }),
                );
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey.shade300.withOpacity(0.6),
                ),
                child: const Icon(
                  Icons.play_arrow_outlined,
                  size: 50,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: size.height * 0.6,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
                color: Colors.grey.shade800.withOpacity(0.6),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              widget.myObj.title!,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: [
                          const Text(
                            'IMDB Rating     ',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                          RatingBar.builder(
                            itemSize: 20,
                            initialRating: double.parse(
                                    widget.myObj.imdbRating.toString()) /
                                2,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              if (kDebugMode) {
                                print(rating);
                              }
                            },
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            'Plot',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            width: 250,
                            child: Text(
                              widget.myObj.plot!,
                              style: const TextStyle(
                                  color: Colors.white60, fontSize: 16),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Actors',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            width: 250,
                            child: Text(
                              widget.myObj.actors!,
                              style: const TextStyle(
                                  color: Colors.white60, fontSize: 16),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Genre',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            widget.myObj.genre!,
                            style: const TextStyle(
                                color: Colors.white60, fontSize: 16),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Release',
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            widget.myObj.released!,
                            style: const TextStyle(
                                color: Colors.white60, fontSize: 16),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
