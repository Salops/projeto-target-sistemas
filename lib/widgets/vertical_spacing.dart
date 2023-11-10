import 'package:flutter/material.dart';

class VerticalSpacing extends StatelessWidget {
  final double spacing;
  const VerticalSpacing({required this.spacing, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: spacing,
    );
  }
}
