// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CircleProgressBar extends StatelessWidget {
  CircleProgressBar({super.key, required this.colors});
  Color colors;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
      color: colors,
    ));
  }
}
