import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'movie.dart';

class MovieHeader extends StatelessWidget {
  final Movie movie;

  const MovieHeader({Key key, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "${movie.Year},${movie.Genre}".toUpperCase(),
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: Colors.blueAccent,
            ),
          ),
          Text(
            "${movie.Title}".toUpperCase(),
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.green.shade900,
            ),
          ),
          Text.rich(
            TextSpan(
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: movie.Plot,
                ),
                TextSpan(
                  text: "More",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.cyan,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
