import 'package:flutter/material.dart';

class Post {

  final String image, title, description;

  final int price, size, id;

  final Color color;

  Post(
      {required this.id,
      required this.image,
      required this.description,
      required this.price,
      required this.color,
      required this.size,
      required this.title
    });
}

List<Post> posts = [

  Post(
    id: 1,
    title: "Maize",
    price: 234,
    size: 12,
    description:
        " maze has been detected.",
    image: "assets/images/maize1.jpg",
    color: const Color(0xFF3D82AE),
  ),

  Post(
    id: 2,
    title: "Maize",
    price: 234,
    size: 12,
    description:
        " maze has been detected.",
    image: "assets/images/maize2.jpg",
    color: const Color(0xFF3D82AE),
  ),

  Post(
    id: 3,
    title: "Maize",
    price: 234,
    size: 12,
    description:
        " maze has been detected.",
    image: "assets/images/maize2.jpg",
    color: const Color(0xFF3D82AE),
  ),
  
];