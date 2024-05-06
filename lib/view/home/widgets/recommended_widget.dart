import 'package:enspd_news/model/recommended.dart';
import 'package:flutter/material.dart';

class RecommendedWidget extends StatelessWidget {
  final Recommended recommeneded;

  const RecommendedWidget({super.key, required this.recommeneded});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      // color: Colors.red,
      width: width * 0.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: width * 0.4,
            height: height * 0.17,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                recommeneded.urlImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            recommeneded.category,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          Text(recommeneded.title),
        ],
      ),
    );
  }
}
