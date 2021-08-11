import 'package:flutter/material.dart';

class ExtraPosters extends StatelessWidget {
  final List<String> posters;

  ExtraPosters(this.posters);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            left: 8.0,
            bottom: 3.0,
          ),
          child: Text(
            "More Posters..",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
              color: Colors.redAccent,
            ),
          ),
        ),
        Container(
          height: 200,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                height: 300,
                width: MediaQuery.of(context).size.width / 2.6,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      posters[index],
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            separatorBuilder: (context, index) => SizedBox(
              width: 8.0,
            ),
            itemCount: posters.length,
          ),
        )
      ],
    );
  }
}
