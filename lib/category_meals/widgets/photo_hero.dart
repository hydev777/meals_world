import 'package:flutter/material.dart';

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
            child: Image.network(
              photo,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress != null) {
                  return const CircularProgressIndicator();
                } else {
                  return child;
                }
              },
              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                if (wasSynchronouslyLoaded) {
                  return child;
                } else {
                  return AnimatedOpacity(
                    opacity: frame == null ? 0 : 1,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeOut,
                    child: child,
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
