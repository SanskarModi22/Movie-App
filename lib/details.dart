import 'package:calculator/Casting.dart';
import 'package:calculator/ExtraPosters.dart';
import 'package:calculator/Horizontal%20Line.dart';
import 'package:calculator/MovieDetailsThumbnail.dart';
import 'package:calculator/MoviePoster.dart';
import 'package:calculator/calc.dart';
import 'package:calculator/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Detail extends StatelessWidget {
  final String movieName;
  final Movie movie;

  const Detail({Key key, this.movieName, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        backgroundColor: Colors.orangeAccent,
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          MovieDetails(
            thumbnail: movie.Images[0],
          ),
          Poster(
            mov: movie,
          ),
          Line(),
          MovieCast(
            movie: movie,
          ),
          Line(),
          ExtraPosters(movie.Images),
        ],
      ),
      // body: Center(
      //   child: Container(
      //
      //     child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //       children: <Widget>[
      //         Center(
      //           child: Padding(
      //             padding: const EdgeInsets.all(8.0),
      //             child: RaisedButton(
      //
      //               onPressed: () => Navigator.pop(context),
      //               elevation: 15.0,
      //               child: Center(
      //                 child: Text(
      //                   "Go Back ${this.movie.Director}",
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
