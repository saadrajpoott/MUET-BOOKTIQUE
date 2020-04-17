import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:booktique/Models/book.dart';
import 'package:booktique/Screens/book_info.dart';

class BookListWidget extends StatefulWidget {
  @override
  _BookListWidgetState createState() => _BookListWidgetState();
}

class _BookListWidgetState extends State<BookListWidget> {
  var allBooksList = [];
  var tempBooksList = [];

  initiateSearch(value) {
    if (value.length == 0) {
      setState(() {
        tempBooksList = [];
      });
    }
    var capitalizedValue =
        value.substring(0, 1).toUpperCase() + value.substring(1);
    if (value.length > 0 && allBooksList.length != 0) {
      tempBooksList = [];
      allBooksList.forEach((element) {
        if (element.title.startsWith(capitalizedValue)) {
          setState(() {
            tempBooksList.add(element);
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    allBooksList.clear();
    final books = Provider.of<List<Book>>(context);
    if (books != null) {
      books.forEach((book) {
        allBooksList.add(book);
      });
    }

    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(),
            padding: EdgeInsets.fromLTRB(5.0, 20.0, 25.0, 10.0),
            decoration: BoxDecoration(),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back),
                  iconSize: 30.0,
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: Container(
                    height: 40.0,
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(245, 242, 208, 1),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: TextField(
                      onChanged: (val) {
                        setState(() {
                          initiateSearch(val);
                        });
                      },
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Book title here',
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 12.0),
                        hintStyle: TextStyle(color: Colors.grey),
                        suffixIcon: Icon(
                          Icons.search,
                          size: 20.0,
                          color: Colors.grey[500],
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 0.0, bottom: 15.0),
              child: ListView.builder(
                itemCount: tempBooksList.length == 0
                    ? allBooksList.length
                    : tempBooksList.length,
                itemBuilder: (BuildContext context, int index) {
                  Book book = tempBooksList.length == 0
                      ? allBooksList[index]
                      : tempBooksList[index];

                  return GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => BookInfo(book: book))),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                          height: 180.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(245, 242, 208, 1),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsets.fromLTRB(100.0, 0.0, 10.0, 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width: 120.0,
                                  child: Text(
                                    '${book.genre}'.toUpperCase(),
                                    style: TextStyle(
                                      fontSize: 10.0,
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.w500,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                Container(
                                  width: 160.0,
                                  child: Text(
                                    book.title,
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(height: 3.0),
                                Container(
                                  width: 110,
                                  child: Text(
                                    '${book.author}',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.grey[800],
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16.0),
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                Text(
                                  '${book.edition} Edition',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 12.0,
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                Text(
                                  book.printStars(book.ratings),
                                  style: TextStyle(
                                      fontSize: 10.0, color: Colors.lightGreen),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 20.0,
                          top: 15.0,
                          bottom: 15.0,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black45,
                                  offset: Offset(0.0, 3.5),
                                  blurRadius: 5,
                                )
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image(
                                image: NetworkImage(book.imageUrl),
                                width: 110.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
