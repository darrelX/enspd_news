import 'package:flutter/material.dart';

class StoryTelling extends StatelessWidget {
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  const StoryTelling(
      {super.key,
      required this.text1,
      required this.text2,
      required this.text3,
      required this.text4});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        const SizedBox(
          height: 150,
        ),
        Container(
            height: height * 0.25,
            decoration: const BoxDecoration(
              color: Colors.blueGrey,
              shape: BoxShape.circle,
            )),
        const SizedBox(
          height: 20,
        ),
        Container(
          constraints: BoxConstraints(maxWidth: width * 0.9),
          child: RichText(
              maxLines: 2,
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: text1,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 32),
                  children: [
                    TextSpan(
                        text: text2,
                        style: const TextStyle(color: Colors.orange)),
                    TextSpan(
                        text: text3,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black))
                  ])),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          constraints: BoxConstraints(maxWidth: width * 0.9),
          child: Opacity(
              opacity: 0.3,
              child: Text(
                text4,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20),
              )),
        ),
        SizedBox(height: height * 0.20)
      ],
    );
  }
}
