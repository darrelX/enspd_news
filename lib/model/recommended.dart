class Recommended {
  final String title;
  final String category;
  final String urlImage;
  const Recommended(
      {required this.category, required this.urlImage, required this.title});

  static const List<Recommended> listCategory = [
    Recommended(
        category: "Recommended", urlImage: "assets/img-3.png", title: "title"),
    Recommended(
        category: "Recommended", urlImage: "assets/img-3.png", title: "title"),
    Recommended(
        category: "Recommended", urlImage: "assets/img-3.png", title: "title"),
    Recommended(
        category: "Recommended", urlImage: "assets/img-3.png", title: "title"),
  ];
}
