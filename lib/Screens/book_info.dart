import 'dart:math';

import 'package:booktique/Widgets/available_status_widget.dart';
import 'package:booktique/Models/book.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookInfo extends StatefulWidget {
  final Book book;

  BookInfo({this.book});

  @override
  _BookInfoState createState() => _BookInfoState(book: book);
}

class _BookInfoState extends State<BookInfo> {
  final Book book;
  _BookInfoState({this.book});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: 300,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 180.0, vertical: 120.0),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(245, 242, 208, 1),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(100.0),
                                  bottomRight: Radius.circular(100.0)))),
                    ),
                    Positioned(
                      top: 10.0,
                      left: 10.0,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back),
                        color: Theme.of(context).primaryColor,
                        iconSize: 30.0,
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    Positioned(
                      top: 70.0,
                      left: 100.0,
                      right: 100.0,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black45,
                                  offset: Offset(0.0, 3.5),
                                  blurRadius: 5,
                                )
                              ],
                            ),
                            child: Hero(
                              tag: book.imageUrl,
                              child: ClipRRect(
                                child: Image(
                                  image: NetworkImage(book.imageUrl),
                                  height: 220,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 5.0,
                            bottom: 5.0,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black45,
                              ),
                              child: Text(
                                book.isAvailable == false ? '0 items' : '21 items',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.0),
              Container(
                width: 330,
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      book.title,
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      book.author,
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[600]),
                    ),
                    SizedBox(height: 5.0),
                    Text(book.printStars(book.ratings)),
                    SizedBox(height: 10.0),
                    Text(
                      book.description != null
                          ? book.description
                          : 'Description not available.',
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 5.0),
                    Row(
                      children: <Widget>[
                        Text(
                          'Edition: ',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          book.edition,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 3.0),
                    Row(
                      children: <Widget>[
                        Text(
                          'Publisher: ',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          book.publisher,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 3.0),
                    Row(
                      children: <Widget>[
                        Text(
                          'ISBN: ',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          book.ISBN,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              book.isAvailable
                  ? AvailableStatus(status: true)
                  : AvailableStatus(status: false, dueDate: book.dueDate),
            ],
          ),
        ],
      )),
    );
  }
}
