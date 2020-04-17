import 'package:booktique/Services/database_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:booktique/Models/book.dart';
import 'package:booktique/Widgets/book_list_widget.dart';

class BookList extends StatefulWidget {
  final heading;

  BookList({this.heading});

  @override
  _BookListState createState() => _BookListState(heading: heading);
}

class _BookListState extends State<BookList> {
  final heading;

  _BookListState({this.heading});

  bool isSearching = false;

  List<String> referenceList = [
    'Software Engineering',
    'Civil Engineering',
    'BS English',
    'Electronics Engineering',
    'Chemical Engineering',
    'Textile Engineering',
    'New Arrivals'
  ];

  String searchChar = '';

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Book>>.value(
      value: heading == referenceList[0]
          ? DatabaseService().softwareStream
          : heading == referenceList[1]
              ? DatabaseService().civilStream
              : heading == referenceList[2]
                  ? DatabaseService().bsEnglishStream
                  : heading == referenceList[3]
                      ? DatabaseService().electronicsStream
                      : heading == referenceList[4]
                          ? DatabaseService().chemicalStream
                          : heading == referenceList[5]
                              ? DatabaseService().textileStream
                              : heading == referenceList[6]
                                  ? DatabaseService().newArrivalsStream
                                  : DatabaseService().newArrivalsStream,
      child: SafeArea(
        child: Scaffold(
          body: BookListWidget(),
        ),
      ),
    );
  }
}
