import 'package:flutter/material.dart';

class BoxContainer extends StatelessWidget {
  final String path;
  final String text;
  final VoidCallback onPressed;
  final Animation<Offset> animation;
  const BoxContainer({
    Key? key,
    required this.path,
    required this.text,
    required this.onPressed,
    required this.animation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation,
      child: InkWell(
        onTap: onPressed,
        child: SizedBox(
          height: 60,
          width: MediaQuery.of(context).size.width - 140,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Image.asset(
                    path,
                    height: 25,
                    width: 25,
                  ),
                  const SizedBox(width: 20),
                  Text(
                    text,
                    style: const TextStyle(fontSize: 16, color: Colors.black87),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
