import 'dart:async';
import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lua_v3/conponents/colors.dart';
import 'package:lua_v3/firebase_options.dart';
import 'package:lua_v3/screens/home_page/famous_coach/evaluation_coach.dart';
import 'package:lua_v3/screens/home_page/famous_coach/evaluation_lesson.dart';
import 'package:lua_v3/screens/home_page/famous_coach/detail_coach/famous_coach.dart';
import 'package:lua_v3/screens/home_page/famous_coach/course.dart';
import 'package:lua_v3/screens/home_page/home_page.dart';
import 'package:lua_v3/screens/login_pages/bloc/login_bloc.dart';
import 'package:lua_v3/screens/login_pages/login_page.dart';
import 'package:lua_v3/screens/setting_page/setting_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  final accessToken = sharedPreferences.getString('accessToken');

  runApp(MyApp(accessToken: accessToken));
}

class MyApp extends StatelessWidget {
  final String? accessToken;

  const MyApp({Key? key, this.accessToken}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => LoginBloc(),
        child: ConnectivityWrapper(
          child: accessToken != null ? const SettingPage() : const LoginPage(),
        ),
      ),
    );
  }
}

class ConnectivityWrapper extends StatefulWidget {
  final Widget child;

  const ConnectivityWrapper({Key? key, required this.child}) : super(key: key);

  @override
  _ConnectivityWrapperState createState() => _ConnectivityWrapperState();
}

class _ConnectivityWrapperState extends State<ConnectivityWrapper> {
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        _startTimer();
      } else {
        _cancelTimer();
      }
    });
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    _cancelTimer();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer(const Duration(seconds: 2), () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 16,
                ),
                Image.asset('assets/images/no_internet.png', height: 150),
                const SizedBox(height: 32),
                const Text(
                  'Vui lòng kiểm tra kết nối Wi-Fi của bạn ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: ColorsApp.backGroundColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'OK',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: ColorsApp.backGroundColor,
                  ),
                ),
              ),
            ],
          );
        },
      );
    });
  }

  void _cancelTimer() {
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
