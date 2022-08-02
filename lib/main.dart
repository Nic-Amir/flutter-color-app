import 'package:flutter/material.dart';
import 'package:flutter_navigation/list_item.dart';
import 'package:flutter_navigation/pick_color_page.dart';
import 'package:flutter_navigation/shades_page.dart';
import 'shades_page_with_params.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Colors',
        theme: ThemeData.dark(),
        home: const MyHomePage(),
        routes: {
          '/shades': (context) => ShadesPageWithParam(),
          '/pickcolor': (context) => PickColorPage(),
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void navigateToShadesPage(BuildContext context, MaterialAccentColor color) {
    Navigator.of(context).pushNamed('/shades', arguments: color);
  }

  void navigateToPickColor(BuildContext context) {
    Navigator.of(context).pushNamed('/pickcolor');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Colors")),
      ),
      body: ListView.separated(
        itemCount: Colors.accents.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              navigateToShadesPage(context, Colors.accents.elementAt(index));
            },
            child: ListItem(color: Colors.accents.elementAt(index)),
          );
        },
        separatorBuilder: (BuildContext context, int index) => Divider(
          height: 12.5,
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          navigateToPickColor(context);
        },
        label: const Text('Pick a Color'),
        icon: const Icon(Icons.colorize_rounded),
        backgroundColor: Colors.white,
      ),
    );
  }
}
