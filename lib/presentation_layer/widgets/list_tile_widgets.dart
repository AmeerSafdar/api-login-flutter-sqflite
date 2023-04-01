// ignore_for_file: file_names, must_be_immutable
import 'package:flutter/material.dart';
import 'package:msincl/presentation_layer/widgets/text_widget.dart';

class ListTileWidgets extends StatelessWidget {
  ListTileWidgets(
      {Key? key, required this.icon, required this.txt, this.tapped})
      : super(key: key);

  Icon icon;
  String txt;
  VoidCallback? tapped;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: tapped,
      leading: icon,
      title: TextsWidgets(data: txt),
    );
  }
}
