import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

class SliverWithAppBar extends StatelessWidget {
  final SliverAppBar appBar;
  final List<Widget> children;

  const SliverWithAppBar({
    Key? key,
    required this.appBar,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverStack(
      children: [
        ...children,
        appBar,
      ],
    );
  }
}
