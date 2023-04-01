// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TextsWidgets extends StatelessWidget {
  String? data;
  TextStyle? styles;
  int? maxliness;
  TextsWidgets({super.key, this.data, this.styles, this.maxliness});

  @override
  Widget build(BuildContext context) {
    return Text(
      data!,
      overflow: TextOverflow.ellipsis,
      softWrap: true,
      maxLines: this.maxliness == null ? 2 : maxliness,
      style: styles,
    );
  }
}
