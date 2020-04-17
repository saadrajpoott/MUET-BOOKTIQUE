import 'package:flutter/material.dart';
import 'package:booktique/Models/catogaries.dart';
import 'package:booktique/Screens/book_list.dart';

class CategoriesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back),
              color: Colors.white),
          title: Text('Categories'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (BuildContext context, int index) {
                Category category = categories[index];
                return GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => BookList(heading: category.name))),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 60.0, vertical: 70.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: AssetImage(category.imageUrl),
                          fit: BoxFit.cover,
                        )),
                    margin: EdgeInsets.all(10.0),
                    width: 130.0,
                    child: Container(
                      width: 300.0,
                      decoration: BoxDecoration(
                        color: Colors.yellow[200],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          category.name,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
