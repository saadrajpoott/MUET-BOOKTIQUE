import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:booktique/Models/book.dart';

class DatabaseService{

  CollectionReference _softwareCollection = Firestore.instance.collection('Software Engineering');
  CollectionReference _bsEnglishCollection = Firestore.instance.collection('BS English');
  CollectionReference _civilCollection = Firestore.instance.collection('Civil Engineering');
  CollectionReference _electronicsCollection = Firestore.instance.collection('Electronics Engineering');
  CollectionReference _textileCollection = Firestore.instance.collection('Textile Engineering');
  CollectionReference _chemicalCollection = Firestore.instance.collection('Chemical Engineering');
  CollectionReference _newArrivalsCollection = Firestore.instance.collection('New Arrivals');


  Future addBook(Book book) async {
    try{
      String temp = _civilCollection
          .document()
          .documentID;
      return _civilCollection.document(temp).setData({
        'title': book.title,
        'author': book.author,
        'publisher': book.publisher,
        'description': book.description,
        'genre': book.genre,
        'searchTag': book.searchTag,
        'ISBN': book.ISBN,
        'ImageUrl': book.imageUrl,
        'isAvailable': book.isAvailable,
        'ratings': book.ratings,
        'dueDate': book.dueDate,
        'edition': book.edition,
      });
    }catch(e){
      print(e.toString());
      return null;
    }
  }


  List<Book> _booListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return Book(
        title: doc.data['title'] ?? '',
        author: doc.data['author'] ?? '',
        publisher: doc.data['publisher'] ?? '',
        imageUrl: doc.data['ImageUrl'] ?? '',
        ratings: doc.data['ratings'] ?? 0,
        dueDate: doc.data['dueDate'] ?? '',
        ISBN: doc.data['ISBN'] ?? '',
        edition: doc.data['edition'] ?? '',
        isAvailable: doc.data['isAvailable'] ?? false,
        description: doc.data['description'] ?? '',
        genre: doc.data['genre'] ?? '',
      );
    }).toList();
  }

  Stream<List<Book>> get electronicsStream {
    return _electronicsCollection.snapshots().map(_booListFromSnapshot);
  }

  Stream<List<Book>> get bsEnglishStream {
    return _bsEnglishCollection.snapshots().map(_booListFromSnapshot);
  }

  Stream<List<Book>> get civilStream {
    return _civilCollection.snapshots().map(_booListFromSnapshot);
  }

  Stream<List<Book>> get softwareStream {
    return _softwareCollection.snapshots().map(_booListFromSnapshot);
  }

  Stream<List<Book>> get chemicalStream {
    return _chemicalCollection.snapshots().map(_booListFromSnapshot);
  }

  Stream<List<Book>> get textileStream {
    return _textileCollection.snapshots().map(_booListFromSnapshot);
  }

  Stream<List<Book>> get newArrivalsStream {
    return _newArrivalsCollection.snapshots().map(_booListFromSnapshot);
  }

}