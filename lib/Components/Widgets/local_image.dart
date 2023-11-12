import 'package:flutter/material.dart';

class LocalImage extends StatelessWidget {
  final String image;
  final double? width, height;
  final BoxFit? fit;

  const LocalImage(
      {Key? key, required this.image, this.width, this.height, this.fit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      height: height,
      width: width,
      fit: fit ?? BoxFit.cover,
    );
  }
}
