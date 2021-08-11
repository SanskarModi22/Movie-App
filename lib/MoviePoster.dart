import 'package:calculator/movie.dart';
import 'package:flutter/material.dart';

import 'Posterdetails.dart';
import 'SpecificDetails.dart';

class Poster extends StatelessWidget {
  final Movie mov;

  const Poster({Key key, this.mov}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Flexible(
        child: Row(
          children: <Widget>[
            PosterDetails(poster: mov.Images[0]),
            SizedBox(
              width: 10.0,
            ),
            MovieHeader(movie:mov),
          ],
        ),
      ),
    );
  }
}
