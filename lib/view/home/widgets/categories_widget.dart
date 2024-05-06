import 'package:flutter/material.dart';

class Grid extends StatelessWidget {
  const Grid({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SizedBox(
      width: width * 0.34,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: width * 0.34,
            height: height * 0.17,
            child: Image.asset(
              'assets/img-3.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
              padding: const EdgeInsets.only(left: 15, top: 7),
              height: height * 0.07,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 241, 241, 241),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        offset: const Offset(5, 10),
                        spreadRadius: 5,
                        blurRadius: 7)
                  ]),
              child: const Text(
                "Marketing & Business",
                textAlign: TextAlign.start,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ))
        ],
      ),
    );
  }
}
