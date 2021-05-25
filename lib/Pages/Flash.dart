import 'package:burgerking/Pages/Home.dart';
import 'package:burgerking/helpers/TriglePainter.dart';
import 'package:burgerking/models/Category.dart';
import 'package:burgerking/models/Tags.dart';
import 'package:burgerking/utils/Api.dart';
import 'package:flutter/material.dart';

class Flash extends StatefulWidget {
  @override
  _FlashState createState() => _FlashState();
}

class _FlashState extends State<Flash> {
  void loadData() async {
    List<Category> cats = await Api.getAllCats();
    List<Tags> tags = await Api.getAllTags();

    if (cats.isNotEmpty && tags.isNotEmpty) {
      Navigator.restorablePushReplacementNamed(context, '/home');
    } else {
      print("Data Loading Error");
    }
  }

  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          CustomPaint(
            painter: TriglePainter(size),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 95, 0, 0),
            child: Text(
              'Food Monkey',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: Image.asset(
              'assets/images/FoodMonkey.png',
              scale: 1.5,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircularProgressIndicator(),
                SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
