import 'package:enspd_news/model/recommended.dart';
import 'package:enspd_news/view/home/widgets/categories_widget.dart';
import 'package:enspd_news/view/home/widgets/recommended_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:enspd_news/auth/authentification.dart';
import 'package:enspd_news/services/firestore.dart';
import 'package:flutter/widgets.dart';
// import 'package:pie_chart/pie_chart.dart';
// import 'package:enspd_news/model/model.dart';

class MainPiece extends StatefulWidget {
  const MainPiece({super.key});

  @override
  State<MainPiece> createState() => _MainPieceState();
}

class _MainPieceState extends State<MainPiece> {
  final List<String> items = List.generate(20, (index) => 'Item ${index + 1}');
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final auth = Auth();
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context).textTheme;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.01,
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Welcome",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.orange,
                    ),
                  ),
                  Text(
                    "${Auth.currentUser!.displayName!.split(' ')[0]} ${Auth.currentUser!.displayName!.split(' ')[1]}" ??
                        Auth.firstNameAuth()!,
                    style: TextStyle(
                        fontSize: theme.headlineSmall!.fontSize,
                        color: theme.headlineSmall!.color,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              // width: width * 0.9,
              child: Center(
                child: TextField(
                  controller: _controller,
                  maxLines: 1,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      labelText: "Search Here",
                      hintTextDirection: TextDirection.ltr,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: height * 0.03,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    child: Center(child: Text("YEss")),
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    // width: 130,
                    constraints: const BoxConstraints(minWidth: 130),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(style: BorderStyle.solid)),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Categories",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  ElevatedButton(
                    onPressed: null,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.orange), // Couleur bleue
                    ),
                    child: Text(
                      "View All",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: height * 0.245,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: const Grid(),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Recommended",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  ElevatedButton(
                    onPressed: null,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.orange), // Couleur bleue
                    ),
                    child: const Text(
                      "View All",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: height * 0.245,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: Recommended.listCategory.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: RecommendedWidget(
                      recommeneded: Recommended.listCategory[index],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
