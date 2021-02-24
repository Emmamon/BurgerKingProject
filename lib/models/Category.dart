class Category {
  String name, image;
  Category({this.name, this.image});
  factory Category.fromJson(dynamic data) {
    return Category(
      name: data['name'], 
      image: data['image']);
  }
}
