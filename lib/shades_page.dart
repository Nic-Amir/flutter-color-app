import 'package:flutter/material.dart';
import 'package:flutter_navigation/list_item.dart';

class ShadesPage extends StatelessWidget {
  final MaterialAccentColor color;

  ShadesPage(this.color);

  @override
  Widget build(BuildContext context) {
    final List<Color> accentShades = [
      color.shade100,
      color.shade200,
      color.shade400,
      color.shade700
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Text("Shades"),
      ),
      body: ListView.separated(
        itemCount: accentShades.length,
        itemBuilder: (BuildContext context, int index) {
          return ListItem(color: accentShades[index]);
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            height: 12.5,
          );
        },
      ),
    );
  }
}
