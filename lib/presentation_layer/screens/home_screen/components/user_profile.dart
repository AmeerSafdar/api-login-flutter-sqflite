import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msincl/blocs/login_blocs/login_bloc.dart';
import 'package:msincl/blocs/login_blocs/login_events.dart';
import 'package:msincl/blocs/login_blocs/login_states.dart';
import 'package:msincl/helper/constants/color_helper.dart';
import 'package:msincl/helper/constants/const.dart';
import 'package:msincl/presentation_layer/widgets/circle_progress.dart';
import 'package:msincl/presentation_layer/widgets/user_profile_row.dart';

class UserPofile extends StatefulWidget {
  const UserPofile({super.key});

  @override
  State<UserPofile> createState() => _UserPofileState();
}

class _UserPofileState extends State<UserPofile> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
    BlocProvider.of<LoginBloc>(context).add(UserLoggedIn(USERD_ID!));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginStates>(
      builder: (context, state) {
        return state.data.isEmpty
            ? CircleProgressBar(
                colors: HexColor(SECONDARY_COLOR),
              )
            : ListView.builder(
                itemCount: state.data.length,
                itemBuilder: (context, i) {
                  final data = state.data[i];
                  return Column(
                    children: [
                      ProfileWidget(
                        text1: "Name",
                        text2: data.name,
                      ),
                      ProfileWidget(
                        text1: "Username",
                        text2: data.username,
                      ),
                      ProfileWidget(
                        text1: "Address",
                        text2: "${data.address!.street}",
                      ),
                      ProfileWidget(
                        text1: "Zipcode",
                        text2: "${data.address!.zipcode}",
                      )
                    ],
                  );
                });
      },
    );
  }
}
