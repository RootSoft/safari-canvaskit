import 'dart:math' as math;

import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  static const routeName = '/search';

  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: ListView(
        scrollDirection: Axis.vertical,
        children: List.generate(
          25,
          (index) => Container(
            height: 50,
            color: randomColor,
          ),
        ),
      ),
    );
  }
}

Color get randomColor =>
    Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
