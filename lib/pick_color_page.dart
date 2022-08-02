import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class PickColorPage extends StatefulWidget {
  const PickColorPage({Key? key}) : super(key: key);

  @override
  State<PickColorPage> createState() => _PickColorPageState();
}

class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {}

  @override
  bool shouldRepaint(MyCustomPainter delegate) {
    return true;
  }
}

class _PickColorPageState extends State<PickColorPage> {
  double redvalue = 0;
  double greenvalue = 0;
  double bluevalue = 0;

  List<Color> savedcolor = [];

  void addToSavedColorArr() {
    setState(() {
      savedcolor.insert(
          0,
          Color.fromARGB(
              250, redvalue.toInt(), greenvalue.toInt(), bluevalue.toInt()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("RGB Picker"),
        ),
        body: Column(
          children: <Widget>[
            Slider(
              min: 0,
              max: 250,
              value: redvalue,
              onChanged: (value) {
                setState(() {
                  redvalue = value;
                });
              },
            ),
            Slider(
              min: 0,
              max: 250,
              value: greenvalue,
              onChanged: (value) {
                setState(() {
                  greenvalue = value;
                });
              },
            ),
            Slider(
              min: 0,
              max: 250,
              value: bluevalue,
              onChanged: (value) {
                setState(() {
                  bluevalue = value;
                });
              },
            ),
            Expanded(
                child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 48,
                    child: GridView.builder(
                        itemCount: savedcolor.length,
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 53, crossAxisSpacing: 10),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                              decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: savedcolor[index],
                          ));
                        }),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(250, redvalue.toInt(),
                            greenvalue.toInt(), bluevalue.toInt()),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        addToSavedColorArr();
                      },
                      child: Text("Save this color")),
                  Container(
                    margin: EdgeInsets.only(
                      top: 20,
                      right: 20,
                      left: 20,
                    ),
                    height: 200,
                    color: Colors.yellow[100],
                    // child: CustomPaint(
                    //   painter: MyCustomPainter(),
                    // ),
                  ),
                ],
              ),
            ))
          ],
        ));
  }
}
