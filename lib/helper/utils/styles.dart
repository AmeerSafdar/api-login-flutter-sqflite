import 'package:flutter/cupertino.dart';
import 'package:msincl/helper/constants/dimension.dart';

import '../constants/color_helper.dart';

class CustomTextStyle {
  static TextStyle nameTextStyle = TextStyle(
    fontSize: Dimensions.FONT_SIZE_DEFAULT,
    fontWeight: FontWeight.bold,
  );

  static TextStyle userName = TextStyle(
    fontSize: Dimensions.FONT_SIZE_LARGE,
    fontWeight: FontWeight.w400,
  );

  static TextStyle userPostTextStyle =
      TextStyle(color: HexColor(SECONDARY_COLOR), fontWeight: FontWeight.bold);

  static TextStyle postsTextStyle = TextStyle(color: HexColor(K_BLACK));
}
