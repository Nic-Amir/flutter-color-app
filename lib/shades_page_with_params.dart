import 'package:flutter/material.dart';
import 'package:flutter_navigation/shades_page.dart';

class ShadesPageWithParam extends StatelessWidget {
  const ShadesPageWithParam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color =
        ModalRoute.of(context)!.settings.arguments as MaterialAccentColor;
    return ShadesPage(color);
  }
}
