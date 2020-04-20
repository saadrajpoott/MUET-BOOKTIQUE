import 'package:flutter/material.dart';
import 'package:booktique/Screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 250),
        child: Center(
          child: Column(
            children: <Widget>[
              ClipRRect(
                child: Image(
                  image: AssetImage('assets/splash_logo.png'),
                  width: 100.0,
                  fit: BoxFit.cover,
                ),
              ),
              Text('MUET BOOKTIQUE',
                  style: GoogleFonts.righteous(
                    fontSize: 29.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                    color: Color.fromRGBO(254, 95, 85, 1),
                  )),
              SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }
}
