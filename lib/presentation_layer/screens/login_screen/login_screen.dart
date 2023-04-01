// ignore_for_file: unused_field, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msincl/blocs/login_blocs/login_bloc.dart';
import 'package:msincl/blocs/login_blocs/login_events.dart';
import 'package:msincl/blocs/login_blocs/login_states.dart';
import 'package:msincl/enum/login_status.dart';
import 'package:msincl/helper/constants/dimension.dart';
import 'package:msincl/helper/constants/image_helper.dart';
import 'package:msincl/helper/constants/string_helper.dart';
import 'package:msincl/helper/extension/snackbar_helper.dart';
import 'package:msincl/helper/extension/validation_helper.dart';
import 'package:msincl/presentation_layer/screens/home_screen/home_screen.dart';
import 'package:msincl/presentation_layer/widgets/button_widget.dart';
import 'package:msincl/presentation_layer/widgets/circle_progress.dart';
import 'package:msincl/presentation_layer/widgets/input_fields.dart';
import 'package:msincl/presentation_layer/widgets/sizedBox.dart';
import 'package:msincl/presentation_layer/widgets/text_widget.dart';

import '../../../helper/constants/color_helper.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  final _formGlobalKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginBloc = BlocProvider.of<LoginBloc>(context);
    return Scaffold(
      body: Center(
        child: BlocConsumer<LoginBloc, LoginStates>(listener: (context, state) {
          if (state.loginStatus == LoginStatus.error) {
            buildSnackbar(context, StringHelper.CHECK_CONNECTION);
          }
          if (state.loginStatus == LoginStatus.loginError) {
            buildSnackbar(context, StringHelper.USERNAME_ERROR);
          }
          if (state.loginStatus == LoginStatus.success) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => HomeScreen()),
                (Route<dynamic> route) => false);
          }
        }, builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                child: Form(
                  key: _formGlobalKey,
                  child: Column(
                    children: [
                      Container(
                        height: Dimensions.D_130,
                        child: Image.asset(ImageHelper.splash),
                      ),
                      SizeBoxWidget(
                        height: Dimensions.D_25,
                      ),
                      TextFieldWidget(
                          hintText: StringHelper.EMAIL,
                          bloc: loginBloc,
                          textEditingController: _emailController,
                          validator: (val) =>
                              '$val'.isEmail() ? null : StringHelper.REQ_FIELD,
                          type: TextInputType.emailAddress),
                      SizeBoxWidget(
                        height: Dimensions.D_20,
                      ),
                      TextFieldWidget(
                          hintText: StringHelper.PASSWORD,
                          bloc: loginBloc,
                          textEditingController: _passwordController,
                          isPasswordField: true,
                          validator: (val) => '$val'.isRequired()
                              ? null
                              : StringHelper.REQ_FIELD,
                          type: TextInputType.emailAddress),
                      SizeBoxWidget(
                        height: Dimensions.D_20,
                      ),
                      ButtonWidgets(
                          pressed: () {
                            if (_formGlobalKey.currentState!.validate()) {
                              loginBloc.add(Login(_emailController.text,
                                  _passwordController.text));
                            }
                          },
                          childs: state.loginStatus == LoginStatus.loading
                              ? CircleProgressBar(
                                  colors: HexColor(K_WHITE),
                                )
                              : TextsWidgets(data: StringHelper.LOGIN))
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
