import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TripDestinyThumbnail extends StatelessWidget {
  final String assetImage;
  final String title;

  const TripDestinyThumbnail(
      {Key? key, required this.assetImage, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(assetImage),
          ),
        ),
      ),
      Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 10,
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                        color: Colors.deepPurple,
                        // bottomLeft
                        offset: Offset(-1.5, -1.5)),
                    Shadow(
                        color: Colors.deepPurple,
                        // bottomRight
                        offset: Offset(1.5, -1.5)),
                    Shadow(
                        color: Colors.deepPurple,
                        // topRight
                        offset: Offset(1.5, 1.5)),
                    Shadow(
                        color: Colors.deepPurple,
                        // topLeft
                        offset: Offset(-1.5, 1.5)),
                  ]),
            ),
          )
        ],
      )

    ]));
  }
}
