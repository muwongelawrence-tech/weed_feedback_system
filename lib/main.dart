import 'package:flutter/material.dart';
import 'package:weedfeedbacksystem/details_screen.dart';
import 'package:weedfeedbacksystem/item_card.dart';
// import 'package:weedfeedbacksystem/post.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';


void main() {
  runApp( const WeedRecognizer());
}

enum APP_THEME { LIGHT, DARK }

class MyAppThemes {
  //Method for changing to the light theme
  static ThemeData appThemeLight() {
    return ThemeData(
      // Define the default brightness and colors for the overall app.
      brightness: Brightness.light,
      //appBar theme
      appBarTheme: const AppBarTheme(
        //ApBar's color
        color:  Color.fromARGB(255, 12, 49, 25),

        //Theme for AppBar's icons
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),

      //Theme for app's icons
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),

      //Theme for FloatingActionButton
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        //White background
        backgroundColor: Colors.white,

        //Black plus (+) sign for FAB
        foregroundColor: Colors.black,
      ),
    );
  }

  //Method for changing to the dark theme.
  static ThemeData appThemeDark() {
    return ThemeData(
      brightness: Brightness.dark,

      appBarTheme: const AppBarTheme(
        color: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),

      iconTheme: const IconThemeData(
        color: Colors.black,
      ),

      //Theme for FloatingActionButton
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        //dark background for FAB
        backgroundColor: Colors.black,

        //White plus (+) sign for FAB
        foregroundColor: Colors.white,
      ),
    );
  }
}

//creating a  stateful widget.
class WeedRecognizer extends StatefulWidget {
  const WeedRecognizer({Key? key}) : super(key: key);

  @override
  _WeedRecognizerState createState() => _WeedRecognizerState();


}

class _WeedRecognizerState extends State<WeedRecognizer> {

    // final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
    // new GlobalKey<RefreshIndicatorState> ();

  //Setting a default theme
  var currentTheme = APP_THEME.LIGHT;

   List posts = [];

void getData() async {

   var response = await Dio().get('https://blooming-ravine-57312.herokuapp.com/api/uploads');

   print("--------------------GETTING DATA FROM THE API------------------");
  //  print(response);

 setState(() {
   posts = response.data;
   print(posts);
 });


}


Future<void> _refresh() async {
    getData();
}


 @override
  void initState() {
    super.initState();
    getData();
  }
 

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // the ThemeData Widget is used to add global themes to the app.
      // setting the theme dynamically.
      theme: currentTheme == APP_THEME.DARK
          ? MyAppThemes.appThemeDark()
          : MyAppThemes.appThemeLight(),
      home: Scaffold(
        appBar: buildAppBarWidget(context), 
        body: buildBodyWidget(context),

        //Code for FAB (floating Action button)
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.threesixty),
          onPressed: () {
            setState(() {
              // Currently selected theme toggles when FAB is pressed
              currentTheme == APP_THEME.DARK
                  ? currentTheme = APP_THEME.LIGHT
                  : currentTheme = APP_THEME.DARK;
            });
          },
        ),
      ),
    );
  }


  // AppBar of the Scaffold Widget.
PreferredSizeWidget buildAppBarWidget(BuildContext context) {
  return AppBar(
    leading: IconButton(
      icon : const Icon(Icons.menu),
      onPressed: () {
          print("Menu being  displayed");
        },
    ),
    title: const Text('Weed Feedback', style: TextStyle(fontSize: 20)),
    actions: <Widget>[
      IconButton(
        icon: const Icon(Icons.refresh),
        tooltip: 'Refresh',
        onPressed: () {
          print("application is being refreshed.");
           
           _refresh();
          //  _refreshIndicatorKey.currentState.show();
          
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

// building the body section
Widget buildBodyWidget( BuildContext context) {
  return SingleChildScrollView(

     child: Column(

      children: <Widget>[

        SizedBox(
            height: 800.0,

            child: Stack(

              children: <Widget>[

                  Stack(
                    children: <Widget>[

                          SizedBox(
                              width: double.infinity,
                              height: 300,
                              child: Image.asset(
                                      'assets/images/weed2.png',
                                      height: 250,
                                      fit: BoxFit.cover,
                              ),
                           ),

                            Positioned(
                             child: Container(
                              padding: const  EdgeInsets.all(30.0),
                               child: const Text(
                                 "Welcome to the weed feed back mobile application, built to let you to receive feedback from the weed detector system after detection of weeds in the area of the garden under surveillence.",
                                  style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.white
                               ), 
                              )),
                              top: 70.0,
                              right:0 ,
                              left: 0,
                          )

                    ],
                ),


           //Second element in the stack
             Positioned(

                child: Container(
                   
                  padding: const EdgeInsets.only(
                      top: 200.0 * 0.12,
                      left: 10.0,
                      right: 10.0,
                      bottom: 20.0
                  ),

                  height: 500,

                  decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                  )),


                  child:  Column(
                      children: <Widget>[
                          
                              
                          const  Center(child: Text("Recent detections",
                           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, fontFamily: 'Roboto'),
                          ),
                          ),

                           Expanded(

                           child: Padding(

                            padding: const EdgeInsets.symmetric(horizontal: 20.0),

                            child: ListView.builder(

                            itemCount: posts.length,

                            itemBuilder: (context ,index) =>  ItemCard(
                            post: posts[index],
                            press: () =>  Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => DetailsScreen(post: posts[index]))
                      ),
                    ),

                 ),
              )
            ),

             ],
           ),
        
        
        ),
                
                right: 0,
                left:0,
                top: 700.0 * 0.3 ,
                bottom: 0,
            ), 
               

          ],

        )),
      ],
    ));
}

  
}

