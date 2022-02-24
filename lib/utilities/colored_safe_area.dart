import 'package:flutter/material.dart';

class ColoredSafeArea extends StatelessWidget {
  final Widget child;

  const ColoredSafeArea({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: theme.scaffoldBackgroundColor,
      child: SafeArea(
        child: child,
      ),
    );
  }
}