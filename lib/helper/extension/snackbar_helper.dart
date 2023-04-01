import 'package:flutter/material.dart';
import 'package:msincl/presentation_layer/widgets/text_widget.dart';

void buildSnackbar(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: TextsWidgets(data: msg),
  ));
}
