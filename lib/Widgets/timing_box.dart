import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TimingBox extends StatelessWidget {
  String heading;
  String timing;

  TimingBox({this.heading, this.timing});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          heading,
          style: GoogleFonts.hindMadurai(
              fontWeight: FontWeight.bold,
              fontSize: 13.0,
              color: Theme.of(context).scaffoldBackgroundColor),
        ),
        SizedBox(height: 2.0),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
          alignment: Alignment.center,
          child: Text(
            timing,
            textAlign: TextAlign.left,
            style: GoogleFonts.righteous(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
