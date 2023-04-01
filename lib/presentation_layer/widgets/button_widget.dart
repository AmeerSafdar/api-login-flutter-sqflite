// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:msincl/helper/constants/dimension.dart';

class ButtonWidgets extends StatelessWidget {
  ButtonWidgets({Key? key, required this.pressed, this.childs})
      : super(key: key);
  VoidCallback pressed;
  Widget? childs;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: Dimensions.D_45,
      child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          Dimensions.RADIUS_EXTRA_LARGE)))),
          onPressed: pressed,
          child: childs),
    );
  }
}
