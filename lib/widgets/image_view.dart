import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  final String url;
  ImageView({required this.url});

  @override
  Widget build(BuildContext context) {
    return FancyShimmerImage(
      imageUrl: url,
      boxFit: BoxFit.cover,
      errorWidget: Image.network(
        'https://icon-library.com/images/image-placeholder-icon/image-placeholder-icon-3.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}
