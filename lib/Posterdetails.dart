import 'package:flutter/material.dart';

class PosterDetails extends StatelessWidget {
  final String poster;

  const PosterDetails({Key key, this.poster}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          width: MediaQuery.of(context).size.width / 2.5,
          height: 180,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(poster),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
