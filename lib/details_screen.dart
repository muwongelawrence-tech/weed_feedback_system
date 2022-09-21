import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weedfeedbacksystem/post.dart';

class DetailsScreen extends StatelessWidget {
  final Post post;

  const DetailsScreen({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: post.color,
      appBar: buildAppBar(context),
      body: buildDetailsBody(context, post),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: post.color,
      elevation: 0,
      leading: IconButton(
          icon: SvgPicture.asset("assets/icons/back.svg", color: Colors.white),
          onPressed: () => Navigator.pop(context)),
      actions: <Widget>[
        IconButton(
          icon:
              SvgPicture.asset("assets/icons/search.svg", color: Colors.white),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset("assets/icons/cart.svg", color: Colors.white),
          onPressed: () {},
        ),
        const SizedBox(
          width: 10.0,
        )
      ],
    );
  }

  Widget  buildDetailsBody(BuildContext context , Post post) {
    return const Center(
       child: Text(" more details are to go here"),
    );
}
}



