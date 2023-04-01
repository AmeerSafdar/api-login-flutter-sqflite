// ignore_for_file: file_names, unused_local_variable, must_be_immutable
import 'package:flutter/material.dart';

class SizeBoxWidget extends StatelessWidget {
  SizeBoxWidget({super.key, this.height, this.width});
  double? height, width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
