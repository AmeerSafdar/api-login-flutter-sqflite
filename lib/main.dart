import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msincl/blocs/login_blocs/login_bloc.dart';
import 'package:msincl/blocs/posts_bloc/post_bloc.dart';
import 'package:msincl/helper/constants/color_helper.dart';
import 'package:msincl/helper/constants/const.dart';
import 'package:msincl/presentation_layer/screens/home_screen/home_screen.dart';
import 'package:msincl/presentation_layer/screens/login_screen/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await db_helper.initDb().then((_) {
    loginRepo.getUserID();
  });
  await Future.delayed(const Duration(seconds: 3)).then((_) {
    FlutterNativeSplash.remove();
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostsBloc>(create: ((context) => PostsBloc())),
        BlocProvider<LoginBloc>(create: ((context) => LoginBloc())),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primaryColor: HexColor(PRIMARY_COLOR),
            secondaryHeaderColor: HexColor(SECONDARY_COLOR),
            primarySwatch:
                HexColor.generateMaterialColor(HexColor(SECONDARY_COLOR)),
          ),
          home: userIDList.length != 0 ? HomeScreen() : LoginScreen()),
    );
  }
}
