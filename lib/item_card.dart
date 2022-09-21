import 'package:flutter/material.dart';
import 'package:weedfeedbacksystem/post.dart';


class ItemCard extends StatelessWidget {
  final Post post;
  final VoidCallback press;

  const ItemCard({Key? key, required this.post, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: press,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                  padding: const EdgeInsets.all(20.0),
                  height: 180,
                  width: 160,
                  decoration: BoxDecoration(
                      color: post.color,
                      borderRadius: BorderRadius.circular(16)),
                  child: Image.asset(post.image)),
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0),
                child: Text(post.title,
                    style: const TextStyle(color: Colors.black))),
            Text(
              "\$${post.price}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ));
  }
}