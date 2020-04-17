class Book {
  String title;
  String author;
  String publisher;
  final String ISBN;
  String edition;
  String imageUrl;
  String searchTag;
  String genre;
  String description;
  bool isAvailable;
  int ratings;
  var dueDate;

  Book(
      {this.title,
      this.author,
      this.publisher,
      this.ISBN,
      this.edition,
      this.imageUrl,
      this.isAvailable,
      this.ratings,
      this.dueDate,
      this.searchTag,
      this.description,
      this.genre});

  printStars(int ratings) {
    String temp = '';
    for (int x = 0; x < ratings; x++) {
      temp += '⭐';
    }
    return temp;
  }
}
