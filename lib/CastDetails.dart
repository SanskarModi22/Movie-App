import 'package:flutter/material.dart';

import 'movie.dart';

class Cast extends StatelessWidget {
  final String value;
  final String field;

  Cast(this.value, this.field);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "${field}: ",
          style: TextStyle(
              fontSize: 14.0, fontWeight: FontWeight.w900, color: Colors.cyan),
        ),
        SizedBox(
          width: 2.0,
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 13.0,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ],
    );
  }
}
