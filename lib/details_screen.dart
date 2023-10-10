import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DetailsScreen extends StatelessWidget {
  // final Post post;
  final post;

  const DetailsScreen({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: post.color,
      appBar: buildAppBarWidget(context),
      body: buildDetailsBody(context, post),
    );
  }

  

// AppBar of the Scaffold Widget.
PreferredSizeWidget buildAppBarWidget(BuildContext context) {
  return AppBar(
    backgroundColor: const Color.fromARGB(255, 12, 49, 25),

    leading: IconButton(
        icon: SvgPicture.asset(
          "assets/icons/back.svg",
          color: Colors.white,
        ),
        onPressed: () => Navigator.pop(context)),
    title: const Text('Weed Feedback', style: TextStyle(fontSize: 20)),
    actions: <Widget>[
      IconButton(
        icon: const Icon(Icons.refresh),
        onPressed: () {
          print("application is being refreshed.");
    
        },
      ),
      IconButton(
        icon: const Icon(Icons.more_vert),
        onPressed: () {
          print("more verting in the application.");
        },
      ),
    ],
  );
 }

Widget  buildDetailsBody(BuildContext context , post) {
    return SingleChildScrollView(
      child: Column(
    children: <Widget>[
      Container(
        height: 800.0,
        color: Colors.black,
        padding: const EdgeInsets.only(
          top: 5.0,
        ),
        child: Stack(
          children: <Widget>[
            //first child of the stack
            Container(
              width: double.infinity,
              height: 350,
              margin: const EdgeInsets.only(left: 5.0, right: 5.0),
              child: post['image'] != null
                  ? Image.network(post['image'],
                     fit: BoxFit.cover, height: 250)
                  : const Text("image not uploaded",
                      style: TextStyle(color: Colors.black)),
            ),

            //Second child of the stack

            Positioned(
              child: Container(
                padding: const EdgeInsets.only(
                    top: 200.0 * 0.12, left: 20.0, right: 20.0, bottom: 20.0),

                height: 500,

                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )
                ),

                child: Container(
                  padding: const EdgeInsets.all(5.0),
                  height:150,
                  width: 130,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children:  <Widget>[

                       Container(
                        margin: const EdgeInsets.all(10.0),
                        child: Text(
                          post['title'],
                          style: const TextStyle(fontWeight: FontWeight.bold , fontSize: 20),
                        ),
                       ),

                        Container(
                        margin: const EdgeInsets.all(10.0),
                        child: const Text(
                          'Recommendations to the Farmer.',
                          style: TextStyle(fontWeight: FontWeight.bold , fontSize: 15),
                        ),
                       ),

                        Container(
                          margin: const EdgeInsets.only(top:10.0),
                          padding: const EdgeInsets.all(10.0),
                          child:  Text(
                            post['feedback'],
                            overflow: TextOverflow.ellipsis,
                            maxLines: 8,
                             softWrap: true,
                          ),
                        ),

                    ],
                  ),

                ),
              ),
              right: 0,
              left: 0,
              top: 360.0,
            )
          ],
        ),
      ),
    ],
  )); 
    
}


//end of screen.
}



