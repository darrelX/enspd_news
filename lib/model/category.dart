import 'package:flutter/material.dart';

class Category {
  final String title;
  final String category;
  final String urlImage;
  const Category(
      {required this.category, required this.urlImage, required this.title});

  static const List<Category> listCategory = [
    Category(category: "category", urlImage: "urlImage", title: "title"),
    Category(category: "category", urlImage: "urlImage", title: "title"),
    Category(category: "category", urlImage: "urlImage", title: "title"),
    Category(category: "category", urlImage: "urlImage", title: "title"),
    Category(category: "category", urlImage: "urlImage", title: "title"),
    Category(category: "category", urlImage: "urlImage", title: "title"),
    Category(category: "category", urlImage: "urlImage", title: "title"),
    Category(category: "category", urlImage: "urlImage", title: "title"),
  ];
}
