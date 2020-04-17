import 'package:booktique/Screens/categories_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:booktique/Models/catogaries.dart';
import 'package:booktique/Screens/book_list.dart';

class CategoriesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          Category category = categories[index];
          return GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => BookList(heading: category.name))),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 40.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: AssetImage(category.imageUrl),
                    fit: BoxFit.cover,
                  )),
              margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
              width: 250.0,
              child: Stack(
                children: <Widget>[
                  Container(
                    width: 120,
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(245, 242, 208, 0.8),
                    ),
                    child: Text(
                      category.name,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.visible,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
