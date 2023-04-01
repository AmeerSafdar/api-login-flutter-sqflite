// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, no_leading_underscores_for_local_identifiers, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:msincl/helper/constants/const.dart';
import 'package:msincl/helper/constants/icon_helper.dart';
import 'package:msincl/helper/constants/image_helper.dart';
import 'package:msincl/helper/constants/string_helper.dart';
import 'package:msincl/presentation_layer/screens/login_screen/login_screen.dart';
import 'package:msincl/presentation_layer/widgets/text_widget.dart';
import 'package:msincl/presentation_layer/widgets/list_tile_widgets.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        // backgroundColor: Theme.of(context).primaryColor,
        child: ListView(
      children: [
        DrawerHeader(
          decoration:
              BoxDecoration(color: Theme.of(context).secondaryHeaderColor),
          child: Column(
            children: [
              CircleAvatar(
                radius: 45,
                backgroundImage: AssetImage(ImageHelper.picture),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(child: TextsWidgets(data: StringHelper.RANDOM_EMAIL)),
            ],
          ),
        ),
        ListTileWidgets(
          tapped: () async {
            db_helper.delete(USERD_ID!);
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => LoginScreen()),
                (Route<dynamic> route) => false);
            ;
          },
          icon: IconHelper.HOME_ICON,
          txt: StringHelper.LOG_OUT,
        ),
      ],
    ));
  }
}
