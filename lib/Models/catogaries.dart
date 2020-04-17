class Category {
  String name;
  String imageUrl;

  Category({this.name, this.imageUrl});
}

List<Category> categories = [
  Category(name: 'Software Engineering', imageUrl: 'assets/software.jpg'),
  Category(name: 'Civil Engineering', imageUrl: 'assets/civil.jpg'),
  Category(name: 'Chemical Engineering', imageUrl: 'assets/chemical.jpg'),
  Category(name: 'Textile Engineering', imageUrl: 'assets/textile.jpg'),
  Category(name: 'BS English', imageUrl: 'assets/english.jpg'),
  Category(name: 'Electronics Engineering', imageUrl: 'assets/electronics.jpg'),
];
