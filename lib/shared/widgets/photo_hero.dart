import 'package:flutter/material.dart';

import 'image_widget.dart';

class PhotoHero extends StatelessWidget {
  const PhotoHero({
    super.key,
    required this.photo,
    required this.width,
    required this.heigth,
  });

  final String photo;
  final double width;
  final double heigth;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: SizedBox(
        height: heigth,
        width: width,
        child: Hero(
          tag: photo,
          child: Material(
            color: Colors.transparent,
            child: ImageWidget(
              src: photo,
            ),
          ),
        ),
      ),
    );
  }
}
