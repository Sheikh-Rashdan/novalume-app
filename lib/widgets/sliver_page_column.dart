import 'package:flutter/material.dart';

class SliverPageColumn extends StatelessWidget {
  const SliverPageColumn({
    super.key,
    required this.appBartitle,
    required this.children,
  });

  final String appBartitle;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text(appBartitle),
          centerTitle: true,
          actions: [],
          actionsPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
        ),
        SliverList(delegate: SliverChildListDelegate(children)),
      ],
    );
  }
}
