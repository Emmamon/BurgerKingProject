import 'package:burgerking/models/Product.dart';
import 'package:burgerking/models/Tags.dart';
import 'package:burgerking/utils/Constants.dart';
import 'package:burgerking/utils/Global.dart';
import 'package:flutter/material.dart';

class Show extends StatefulWidget {
  @override
  _ShowState createState() => _ShowState();
}

class _ShowState extends State<Show> {
  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        actions: [
          Container(
            padding: EdgeInsets.only(top: 20),
            margin: EdgeInsets.only(right: 30),
            child: Stack(
              overflow: Overflow.visible,
              children: [
                Icon(Icons.shopping_cart),
                Positioned(
                    top: -16,
                    right: -12,
                    child: Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                          color: accent,
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                        child: Text(
                          Global.cartProducts.length.toString(),
                          style: TextStyle(color: primary, fontSize: 12),
                        ),
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(color: primary),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tags.length,
              itemBuilder: (context, index) =>
                  _makeNavBarItem(index, tags[index]),
            ),
          ),Expanded(child: _makeProducts(products))
        ],
      ),
    );
  }

  Widget _makeProducts(List<Product> products) {
    return GridView.builder(
        itemCount: products.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) => _makeCardProduct(products[index]));
  }

  Widget _makeCardProduct(Product product) {
    return Card(
      child: Column(
        children: [
          SizedBox(
            height: 7,
          ),
          Text(
            product.name,
            style: TextStyle(color: normal, fontSize: 18),
          ),
          Image.asset(
            "assets/images/${product.image}",
            width: 120,
            height: 120,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    Global.addToCart(product);
                    Global.cartProducts.forEach((pd) {
                      print("Name ${pd.name} count ${pd.count}");
                    });
                  });
                },
                child: Icon(
                  Icons.shopping_cart,
                  size: 25,
                  color: accent,
                ),
              ),
              Text(
                '3500 Ks',
                style: TextStyle(color: normal, fontSize: 18),
              ),
              Icon(
                Icons.visibility,
                size: 25,
                color: accent,
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _makeNavBarItem(index, Tags tag) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 9),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = index;
              });
            },
            child: Text(
              tag.name,
              style: TextStyle(fontSize: 18),
            ),
          ),
          Container(
            height: 3,
            width: 50,
            decoration: BoxDecoration(
                color: currentIndex == index ? accent : Colors.transparent),
          )
        ],
      ),
    );
  }
}
