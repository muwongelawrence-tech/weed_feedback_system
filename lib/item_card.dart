import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:weedfeedbacksystem/post.dart';

//creating a  stateful widget.
class ItemCard extends StatefulWidget {
  final post;
  final VoidCallback press;

  const ItemCard({Key? key, this.post, required this.press}) : super(key: key);

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  // final  post;
  // final  time;
  // final VoidCallback press;
  DateTime? date;

  // ItemCard({ Key? key, required this.post, required this.press, required this.time })
  //     : super(key: key);

  // DateTime now = post['date'];
  // @override
  // void initState() {
  //   super.initState();
  //   getDate();
  // }

  getFormattedDateFromFormattedString(
      {required value,
      required String currentFormat,
      required String desiredFormat,
      isUtc = false}) {
    DateTime? dateTime = DateTime.now();
    if (value != null || value.isNotEmpty) {
      try {
        dateTime = DateFormat(currentFormat).parse(value, isUtc).toLocal();
      } catch (e) {
        print("$e");
      }
    }
    return dateTime;
  }

  // void getDate() {
  //   DateTime dateTime = getFormattedDateFromFormattedString(
  //       value: widget.post['date'],
  //       currentFormat: "yyyy-MM-ddTHH:mm:ssZ",
  //       desiredFormat: "yyyy-MM-dd HH:mm:ss");

  //   print(dateTime); //2021-12-15 11:10:01.000

  //   setState(() {
  //     date = dateTime;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.press,
        child: Container(
            // crossAxisAlignment: CrossAxisAlignment.start,
            margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
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
                            // image: AssetImage( post.image),
                            image: NetworkImage(
                                "https://blooming-ravine-57312.herokuapp.com/" +
                                    widget.post['image'].substring(7)),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Text(
                      widget.post['confidence'],
                      style: const TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                      ),
                    ))),

                // second container
                Container(
                  padding: const EdgeInsets.all(5.0),
                  height: 150,
                  width: 130,
                  decoration: BoxDecoration(
                      // color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: <Widget>[
                      Center(
                        child: Text(
                          widget.post['title'],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          widget.post['feedback'],
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          softWrap: true,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 2.0),
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          // DateFormat.yMd().add_jm().format(date!),
                          DateFormat.yMd().add_jm().format(
                              getFormattedDateFromFormattedString(
                                  value: widget.post['date'],
                                  currentFormat: "yyyy-MM-ddTHH:mm:ssZ",
                                  desiredFormat: "yyyy-MM-dd HH:mm:ss")),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 10),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )));
  }
}
