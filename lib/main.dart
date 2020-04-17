import 'package:flutter/material.dart';
import 'package:booktique/Screens/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Booktique',
      theme: ThemeData(
          primaryColor: Color.fromRGBO(34, 7, 46, 1),
          accentColor: Color.fromRGBO(34, 7, 46, 1),
          scaffoldBackgroundColor: Colors.white,
          textTheme: TextTheme(
              // REMAINING
              )),
      home: SplashScreen(),
    );
  }
}
