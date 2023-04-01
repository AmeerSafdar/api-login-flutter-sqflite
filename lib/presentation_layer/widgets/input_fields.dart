// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:msincl/blocs/login_blocs/login_bloc.dart';
import 'package:msincl/blocs/login_blocs/login_events.dart';
import 'package:msincl/helper/constants/color_helper.dart';
import 'package:msincl/helper/constants/icon_helper.dart';

class TextFieldWidget extends StatefulWidget {
  TextFieldWidget(
      {super.key,
      this.hintText,
      required this.textEditingController,
      required this.validator,
      this.icons,
      required this.bloc,
      this.isPasswordField,
      required this.type});
  String? hintText;
  bool? isPasswordField;
  TextEditingController textEditingController;
  final String? Function(String? val) validator;
  TextInputType type;
  Icon? icons;
  LoginBloc bloc;
  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool isHide = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.type,
      controller: widget.textEditingController,
      obscureText: widget.isPasswordField == true ? isHide : false,
      obscuringCharacter: "*",
      validator: widget.validator,
      decoration: InputDecoration(
          suffixIcon: widget.isPasswordField == true
              ? IconButton(
                  onPressed: () {
                    isHide = !isHide;
                    widget.bloc.add(HideShowPassword());
                  },
                  icon: !isHide ? IconHelper.HIDE_ICON : IconHelper.SHOW_ICON)
              : null,
          border: InputBorder.none,
          filled: true,
          fillColor: HexColor(PLATINIUM),
          labelText: widget.hintText),
    );
  }
}
