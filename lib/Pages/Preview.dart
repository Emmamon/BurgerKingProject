import 'package:burgerking/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class Preview extends StatefulWidget {
  @override
  _PreviewState createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Preview"),
        actions: [
          IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {})
        ],
      ),
      body: Stack(
        children: [
          CustomPaint(
            painter: ArcPainter(size),
          ),
          Center(
              child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Big Burger",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: normal,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                  Center(
                    child: Image.asset(
                      "assets/images/9.png",
                      width: 200,
                      height: 200,
                    ),
                  ),
                  _buildRichText("Price", "3500 ks"),
                  // SizedBox( height: 2,),
                  _buildRichText("Size", "Large Size"),

                  _buildRichText("Promo", "Coca Cola"),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          onPressed: () {},
                          color: normal,
                          child: Icon(
                            Icons.shopping_cart,
                            color: primary,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: SizedBox(
                        height: 50,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          onPressed: () {},
                          color: normal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Detail...",
                                style: TextStyle(color: primary, fontSize: 25),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.visibility,
                                color: primary,
                              )
                            ],
                          ),
                        ),
                      ))
                    ],
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }

  Widget _buildRichText(t1, t2) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: "$t1\n",
          style:
              TextStyle(color: primary, fontSize: 40, fontFamily: "English")),
      TextSpan(
          text: "$t2\n",
          style: TextStyle(color: normal, fontSize: 20, fontFamily: "English")),
    ]));
  }
}

class ArcPainter extends CustomPainter {
  var mediaSize;
  ArcPainter(this.mediaSize);
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = secondary;
    final rect =
        Rect.fromLTRB(-550, 100, mediaSize.width + 5, mediaSize.height + 500);
    final startAngle = -degreeToRadian(100);
    final sweepAngle = degreeToRadian(300);
    final useCenter = false;

    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);
  }

  degreeToRadian(value) {
    return value * (math.pi / 100);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
