import 'package:flutter/material.dart';

class PickColorPage extends StatefulWidget {
  const PickColorPage({Key? key}) : super(key: key);

  @override
  State<PickColorPage> createState() => _PickColorPageState();
}

class _PickColorPageState extends State<PickColorPage> {
  double redvalue = 0;
  double greenvalue = 0;
  double bluevalue = 0;

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
                  Center(
                    child: Text("Select le Color"),
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
                        Navigator.pop(context);
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                  title: Row(
                                    children: <Widget>[
                                      Text('Your color is'),
                                      Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color.fromARGB(
                                                250,
                                                redvalue.toInt(),
                                                greenvalue.toInt(),
                                                bluevalue.toInt()),
                                          ))
                                    ],
                                  ),
                                  content:
                                      const Text('Thats all, congrats mate :)'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'Okay'),
                                      child: const Text('Okay'),
                                    ),
                                  ]);
                            });
                      },
                      child: Text("Pick"))
                ],
              ),
            ))
          ],
        ));
  }
}
