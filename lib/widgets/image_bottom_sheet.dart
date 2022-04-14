import 'package:flutter/material.dart';

class ImageBottomSheet extends StatelessWidget {
  final String title;
  final VoidCallback cameraPressed;
  final VoidCallback galleryPressed;
  const ImageBottomSheet({
    Key? key,
    required this.title,
    required this.cameraPressed,
    required this.galleryPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontSize: 20.0,
            ),
          ),
          const SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            TextButton.icon(
              icon: const Icon(
                Icons.camera,
                color: Color(0xff00A86B),
              ),
              onPressed: cameraPressed,
              label: const Text(
                'Camera',
                style: TextStyle(
                  color: Color(0xff00A86B),
                ),
              ),
            ),
            TextButton.icon(
              icon: const Icon(
                Icons.image,
                color: Color(0xff00A86B),
              ),
              onPressed: galleryPressed,
              label: const Text(
                'Gallery',
                style: TextStyle(
                  color: Color(0xff00A86B),
                ),
              ),
            ),
          ])
        ],
      ),
    );
  }
}
