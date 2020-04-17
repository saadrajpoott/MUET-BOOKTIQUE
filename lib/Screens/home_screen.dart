import 'dart:ui';
import 'package:booktique/Services/database_services.dart';
import 'package:booktique/Widgets/categories_widget.dart';
import 'package:booktique/Widgets/timings_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:booktique/Widgets/new_arrivals_widget.dart';
import 'package:provider/provider.dart';
import 'package:booktique/Models/book.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Book>>.value(
      value: DatabaseService().newArrivalsStream,
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 30.0, left: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('MUET BOOKTIQUE',
                            style: GoogleFonts.righteous(
                              fontSize: 29.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                              color: Color.fromRGBO(254, 95, 85, 1),
                            )),
                        Text(
                          'Find your next read',
                          style: GoogleFonts.hindMadurai(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.1,
                              color: Theme.of(context).accentColor),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0),
                  CategoriesWidget(),
                  SizedBox(height: 15.0),
                  NewArrivalsWidget(),
                  SizedBox(height: 5.0),
                  TimingsWidget(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
