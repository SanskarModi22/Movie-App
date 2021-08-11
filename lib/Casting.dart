import 'package:flutter/material.dart';

import 'CastDetails.dart';
import 'movie.dart';

class MovieCast extends StatelessWidget {
  final Movie movie;

  const MovieCast({Key key, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Cast(movie.Actors, "Actors"),
          Cast(movie.Director, "Director"),
          Cast(movie.Awards, "Awards"),
          Cast(movie.Language, "Language"),
          Cast(movie.Country, "Country"),
        ],
      ),
    );
  }
}
