import 'package:flutter/material.dart';

void main() {
  runApp(const WeedRecognizer());
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
  //Setting a default theme
  var currentTheme = APP_THEME.LIGHT;

 

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
        appBar: buildAppBarWidget(), //AppBar
        body: const Center(child: Text("Get Feedback"),), //body

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
}

// AppBar of the Scaffold Widget.
PreferredSizeWidget buildAppBarWidget() {
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