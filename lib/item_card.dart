import 'package:flutter/material.dart';
// import 'package:weedfeedbacksystem/post.dart';


class ItemCard extends StatelessWidget {
  final  post;
  final VoidCallback press;

  const ItemCard({ Key? key, required this.post, required this.press })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: press,
        
        child: Container(
          // crossAxisAlignment: CrossAxisAlignment.start,
          margin: const EdgeInsets.only(
            top: 10.0,
            bottom: 10.0
          ),

          padding: const EdgeInsets.all(10.0),
          height: 180,
          width: 160,
          decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(16)),

          child: Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: <Widget>[
                // first container

                Container(
                  // padding: const EdgeInsets.all(0.0),
                  height: 150,
                  width: 140,
                  decoration: BoxDecoration(
                    // color: Colors.blue,
                    image: DecorationImage(
                            // image: AssetImage("https://blooming-ravine-57312.herokuapp.com/" + post.image),
                            image:NetworkImage("https://blooming-ravine-57312.herokuapp.com/" + post['image'].substring(7)),
                           fit: BoxFit.cover
                    ),

                    borderRadius: BorderRadius.circular(10)),
                  child: Center(child: Text(post['confidence'] , style:  const TextStyle(fontSize: 35, color:  Colors.white, ),))
                ),
                 
                 // second container
                  Container(
                  padding: const EdgeInsets.all(5.0),
                  height:150,
                  width: 130,
                  decoration: BoxDecoration(
                    // color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children:  <Widget>[

                        Center(
                        child:  Text(
                          post['title'],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                       ),

                        Container(
                          margin: const EdgeInsets.only(top:10.0),
                          padding: const EdgeInsets.all(5.0),
                          child:  Text(
                            post['feedback'],
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                             softWrap: true,
                          ),
                        ),

                    ],
                  ),

                ),
                 

              
                
                
             

            ],
          )
          

         
        ));
  }
}