import 'package:burgerking/models/Category.dart';
import 'package:burgerking/models/Tags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Home extends StatelessWidget {
  List<Category> cats;
  List<Tags> tags;
  Home(this.cats, this.tags);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home', style: TextStyle(fontSize: 30)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _getTitleText('Tags'),
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
          _getTitleText("Categories"),
          SizedBox(
            height: 20,
          ),
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
                itemBuilder: (context, index) {
                  
                    return Image.asset("assets/images/${cats[index].image}");
                  
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  _getTitleText(text) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
      decoration: BoxDecoration(
        color: Colors.brown,
        borderRadius: BorderRadius.only(topRight: Radius.circular(150)),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 30, color: Colors.white),
      ),
    );
  }
}
