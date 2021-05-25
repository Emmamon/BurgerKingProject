import 'package:burgerking/models/Category.dart';
import 'package:burgerking/models/Tags.dart';
import 'package:burgerking/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home', style: TextStyle(fontSize: 30)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildTitleTaxBar("Tags"),
          Container(
            height: 150,
            child: Expanded(
              child: Swiper(
                  itemCount: tags.length,
                  viewportFraction: 0.5,
                  scale: 0.5,
                  autoplay: true,
                  itemBuilder: (context, index) {
                    return Image.asset("assets/images/${tags[index].image}");
                  }),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          _buildTitleTaxBar("Categories"),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: cats.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.7,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) =>
                    _buildCategoryCard(cats[index]),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCategoryCard(Category cat) {
    return Card(
      child: Image.asset("assets/images/${cat.image}"),
    );
  }

  Widget _buildTitleTaxBar(text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          color: secondary,
          borderRadius: BorderRadius.only(topRight: Radius.circular(80))),
      child: Text(
        text,
        style:
            TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: normal),
      ),
    );
  }
}
