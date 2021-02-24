class Product {
  int count = 1;
  String id, name, image;

  Product({this.id, this.name, this.image});

  factory Product.fromJson(dynamic data) {
    return Product(
      id: data['id'], 
      name: data['name'], 
      image: data['image'],
      );
  }
}
