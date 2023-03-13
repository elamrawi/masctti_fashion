import 'package:flutter/material.dart';

class ImageProduct extends StatelessWidget {
  final String urlImage;
  const ImageProduct({super.key, required this.urlImage});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
          width: 147,
          height: 150,
          child: Image.network(
            urlImage,
            fit: BoxFit.cover,
          )),
    );
  }
}
