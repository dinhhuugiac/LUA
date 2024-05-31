import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lua_v3/conponents/colors.dart';
import 'package:lua_v3/screens/acountpages/bloc/account_bloc.dart';
import 'package:lua_v3/screens/acountpages/account_page.dart';
import 'package:lua_v3/screens/login_pages/bloc/login_bloc.dart';
import 'package:lua_v3/screens/login_pages/bloc/login_event.dart';
import 'package:lua_v3/screens/login_pages/bloc/login_state.dart';
import 'package:lua_v3/screens/registers/bloc/register_bloc.dart';
import 'package:lua_v3/screens/registers/register_page.dart';
import 'package:lua_v3/screens/setting_page/setting_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool languageSelected = false;
  String selectedLanguage = ' ';
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) async {
        if (state is LoginSuccessState) {
          if (state.userDetail!.phone_number != null &&
              state.userDetail!.phone_number!.isNotEmpty) {
            await Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (builder) => BlocProvider(
                  create: (context) => AccountBloc(),
                  child: const SettingPage(),
                ),
              ),
            );
          } else {
            await Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (builder) => BlocProvider.value(
                  value: context.read<LoginBloc>(),
                  child: BlocProvider(
                    create: (context) => RegisterBloc(),
                    child: const RegisterPage(),
                  ),
                ),
              ),
            );
          }
        } else if (state is LoginFailState) {
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
                          color: ColorsApp.backGroundColor),
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
                          color: ColorsApp.backGroundColor),
                    ),
                  ),
                ],
              );
            },
          );
        } else if (state is LoginErrorState) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              //     content: Text(state.errorMessage ?? ''),
              //   ));
              // }
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
                      // state.errorMessage ??
                      //     ''
                      'LOGIN GOOGLE FAIL BECAUSSE NOT CONNECT INTERNET',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: ColorsApp.backGroundColor),
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
                          color: Colors.red),
                    ),
                  ),
                ],
              );
            },
          );
        }
      },
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(
                        width: 16,
                      ),
                      Container(
                        child: GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return StatefulBuilder(
                                  builder: (BuildContext context,
                                      StateSetter setState) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16,
                                          right: 16,
                                          top: 16,
                                          bottom: 35),
                                      child: SizedBox(
                                        height: 328,
                                        child: Column(
                                          children: [
                                            const Center(
                                              child: Text(
                                                'Select language',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  selectedLanguage =
                                                      'vietnamese';
                                                  languageSelected = true;
                                                });
                                              },
                                              child: SizedBox(
                                                height: 56,
                                                width: 382,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      child: Row(
                                                        children: [
                                                          SvgPicture.asset(
                                                            'assets/icons/icon holder.svg',
                                                            width: 36,
                                                            height: 24,
                                                          ),
                                                          const SizedBox(
                                                            width: 8,
                                                          ),
                                                          const Text(
                                                            'Vietnamese',
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: Color(
                                                                  0xfff2d3748),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Radio(
                                                      activeColor: const Color(
                                                          0xfff67a800),
                                                      value: 'vietnamese',
                                                      groupValue:
                                                          selectedLanguage,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          selectedLanguage =
                                                              value.toString();
                                                          languageSelected =
                                                              true;
                                                        });
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 56,
                                              width: 382,
                                              child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    selectedLanguage =
                                                        'english';
                                                    languageSelected = true;
                                                  });
                                                },
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    SizedBox(
                                                      child: Row(
                                                        children: [
                                                          SvgPicture.asset(
                                                            'assets/icons/United Kingdom.svg',
                                                            width: 36,
                                                            height: 24,
                                                          ),
                                                          const SizedBox(
                                                            width: 8,
                                                          ),
                                                          const Text(
                                                            'English',
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: Color(
                                                                  0xfff2d3748),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Radio(
                                                      activeColor: const Color(
                                                          0xfff67a800),
                                                      value: 'english',
                                                      groupValue:
                                                          selectedLanguage,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          selectedLanguage =
                                                              value.toString();
                                                          languageSelected =
                                                              true;
                                                        });
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 130,
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                if (languageSelected) {
                                                  Navigator.pop(context);
                                                }
                                              },
                                              style: TextButton.styleFrom(
                                                minimumSize:
                                                    const Size(390, 56),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                backgroundColor:
                                                    ColorsApp.backGroundColor,
                                              ),
                                              child: const Text(
                                                'Confirm',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xFFFFFFFF),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          },
                          child: SvgPicture.asset(
                            'assets/icons/icon holder.svg',
                            width: 36,
                            height: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'Chào mừng đến với LUA',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFFFFFFF)),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'Sed vel turpis adipiscing penatibus orci neque. Erat sed fermentum ipsum vel quis quam. Nunc etiam dui tortor, non in aliquam lacinia tempor.',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFFFFFFF)),
                  ),
                  const SizedBox(
                    height: 502,
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: const Size(378, 59),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        backgroundColor: const Color(0xFFFFFFFF),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 16,
                          ),
                          SvgPicture.asset('assets/icons/apple.svg'),
                          const SizedBox(
                            width: 16,
                          ),
                          const Text(
                            'Đăng nhập với Google',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xfff1a202c)),
                          )
                        ],
                      )),
                  const SizedBox(
                    height: 16,
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: const Size(378, 59),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        backgroundColor: const Color(0xFFFFFFFF),
                      ),
                      onPressed: () {
                        BlocProvider.of<LoginBloc>(context)
                            .add(HandleGoogleSignInEvent());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 16,
                          ),
                          SvgPicture.asset('assets/icons/google.svg'),
                          const SizedBox(
                            width: 16,
                          ),
                          const Text(
                            'Đăng nhập với Google',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xfff1a202c)),
                          )
                        ],
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
