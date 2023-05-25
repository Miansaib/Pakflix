import 'package:cloud_firestore/cloud_firestore.dart';

class Movie {
  String? title;
  String? year;
  String? rated;
  String? released;
  String? runtime;
  String? genre;
  String? director;
  String? writer;
  String? actors;
  String? plot;
  String? url;
  String? poster;
  String? imdbRating;
  // late final List<Movie>? search;
  Movie(
      {
         this.title,
         this.year,
         this.rated,
         this.released,
         this.runtime,
         this.genre,
         this.director,
         this.writer,
         this.actors,
        this.plot,
        this.url,
        this.poster,
        // this.search,
        this.imdbRating,
        });

  factory Movie.fromSnapshot(Map<String, dynamic> snapshot) {
    return Movie(
      title: snapshot['Title'],
      year: snapshot['Year'],
      rated: snapshot['Rated'],
      released: snapshot['Released'],
      runtime: snapshot['Runtime'],
      genre: snapshot['Genre'],
      director: snapshot['Director'],
      writer: snapshot['Writer'],
      actors: snapshot['Actors'],
      plot: snapshot['Plot'],
      url: snapshot['Website'],
      poster: snapshot['Poster'],
      imdbRating: snapshot['imdbRating'],
    );
}
  // Movie.fromSnapshot(  Map<String, dynamic> json, ) {
  //   // Map<String, dynamic> json = snapshot.data() as Map<String, dynamic>;
  //
  //   title = json['Title'];
  //   year = json['Year'];
  //   rated = json['Rated'];
  //   released = json['Released'];
  //   runtime = json['Runtime'];
  //   genre = json['Genre'];
  //   director = json['Director'];
  //   writer = json['Writer'];
  //   actors = json['Actors'];
  //   plot = json['Plot'];
  //   poster = json['Poster'];
  //   imdbRating = json['imdbRating'];
  //   url = json['URL'];
  //   poster  = json['Poster'];
  //   // search=json['search'];
  // }

}
