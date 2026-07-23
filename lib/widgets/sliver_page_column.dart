import 'package:flutter/material.dart';

class SliverPageColumn extends StatelessWidget {
  const SliverPageColumn({
    super.key,
    required this.appBartitle,
    required this.children,
    this.actions = const [],
  });

  final String appBartitle;
  final List<Widget> children;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text(appBartitle),
          centerTitle: true,
          actions: actions,
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
