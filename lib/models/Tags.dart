class Tags {
  String name, image;
  Tags({this.name, this.image});
  factory Tags.fromJson(dynamic data) {
    return Tags(
      name: data['name'],
      image: data['image']
    );
  }
}
