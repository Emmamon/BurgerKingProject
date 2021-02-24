import 'package:burgerking/models/Product.dart';

class Global {
  static List<Product> cartProducts = [];

  static addToCart(product) {
    var exist = false;

    if (cartProducts.length > 0) {
      cartProducts.forEach((element) {
        if (element.id == product.id) {
          element.count++;
          exist = true;
        }
      });
    }
    if (!exist) {
      cartProducts.add(product);
    }
  }
}
