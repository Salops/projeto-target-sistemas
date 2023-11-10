import 'package:flutter/material.dart';

class HorizontalSpacing extends StatelessWidget {
  final double spacing;

  const HorizontalSpacing({
    required this.spacing,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: spacing,
    );
  }
}
