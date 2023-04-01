// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:msincl/helper/constants/dimension.dart';
import 'package:msincl/presentation_layer/widgets/text_widget.dart';
import 'package:msincl/helper/utils/styles.dart';

class ProfileWidget extends StatelessWidget {
  ProfileWidget({super.key, this.text1, this.text2});
  String? text1, text2;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.PADDING_SIZE_LARGE,
            vertical: Dimensions.PADDING_SIZE_SMALL),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextsWidgets(
              data: text1,
              styles: CustomTextStyle.nameTextStyle,
            ),
            TextsWidgets(
              data: text2,
              styles: CustomTextStyle.userName,
              maxliness: 3,
            ),
          ],
        ),
      ),
    );
  }
}
