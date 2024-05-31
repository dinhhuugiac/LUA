import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lua_v3/conponents/colors.dart';
import 'package:lua_v3/screens/acountpages/bloc/account_bloc.dart';
import 'package:lua_v3/screens/acountpages/bloc/account_event.dart';
import 'package:lua_v3/screens/acountpages/bloc/account_state.dart';

import 'package:lua_v3/screens/login_pages/bloc/login_bloc.dart';
import 'package:lua_v3/screens/login_pages/login_page.dart';
import 'package:lua_v3/screens/update_pages/bloc/update_bloc.dart';
import 'package:lua_v3/screens/update_pages/update_page.dart';
import 'package:lua_v3/screens/update_topic/bloc/update_topic_bloc.dart';
import 'package:lua_v3/screens/update_topic/update_topic_page.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _HomePageState();
}

class _HomePageState extends State<AccountPage> {
  String? fullName = '';
  String? avatar = '';

  @override
  void initState() {
    super.initState();
    context.read<AccountBloc>().add(ChosseAccountEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountBloc, AccountState>(
      builder: (context, state) {
        if (state.status == AccountStatus.success) {
          fullName = state.userDetail?.full_name ?? 'user';
          avatar = state.userDetail?.avatar ?? '';
        } else {}
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 42,
                  ),
                  SizedBox(
                    height: 84,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 0, bottom: 8, top: 16),
                      child: Row(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(avatar!)),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          SizedBox(
                            height: 60,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 12, bottom: 8, left: 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 17,
                                    child: Text(
                                      fullName!,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  const Text(
                                    'Người mới',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xfff7d879c),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 56,
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0xfffe2e8f0),
                            width: 1.0,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (builder) => BlocProvider.value(
                                  value: context.read<AccountBloc>(),
                                  child: BlocProvider(
                                    create: (context) => UpdateBloc(),
                                    child: const UpdatePage(),
                                  ),
                                ),
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/icons/person_home.svg'),
                              const SizedBox(
                                width: 8,
                              ),
                              const Text(
                                'Tài khoản của tôi',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xfff2d3748),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (builder) => BlocProvider.value(
                            value: context.read<AccountBloc>(),
                            child: BlocProvider(
                              create: (context) => UpdateTopicBloc(),
                              child: const UpdateTopicPage(),
                            ),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 72,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image:
                              AssetImage('assets/images/background_home.png'),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    'assets/images/background_home.png'),
                              ),
                            ),
                          ),
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.7),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/person_home_2.svg',
                                ),
                                const SizedBox(width: 8),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Đăng ký trở thành huấn\n luyện viên',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: ColorsApp.backGroundColor,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 95),
                                GestureDetector(
                                  onTap: () {},
                                  child: SvgPicture.asset(
                                    'assets/icons/chevron-right_home.svg',
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 34,
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 56,
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color(0xfffe2e8f0),
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/dollar-sign_home.svg',
                                    ),
                                    const SizedBox(width: 8),
                                    const Text(
                                      'Gói đăng ký',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xfff2d3748),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 56,
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color(0xfffe2e8f0),
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/globe_home.svg',
                                    ),
                                    const SizedBox(width: 8),
                                    const Text(
                                      'Ngôn ngữ',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xfff2d3748),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 56,
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color(0xfffe2e8f0),
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/credit-card_home.svg',
                                    ),
                                    const SizedBox(width: 8),
                                    const Text(
                                      'Thanh toán',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xfff2d3748),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 56,
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color(0xfffe2e8f0),
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/help-circle_home.svg',
                                    ),
                                    const SizedBox(width: 8),
                                    const Text(
                                      'Trung tâm hỗ trợ',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xfff2d3748),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 56,
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color(0xfffe2e8f0),
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/shield_home.svg',
                                    ),
                                    const SizedBox(width: 8),
                                    const Text(
                                      'Quyền riêng tư và bảo mật',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xfff2d3748),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              _showLogoutConfirmationDialog(
                                  context.read<AccountBloc>());
                            },
                            child: Container(
                              height: 56,
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color(0xfffe2e8f0),
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/log-out_home.svg',
                                    ),
                                    const SizedBox(width: 8),
                                    const Text(
                                      'Đăng xuất',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xfffeb2d2d),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 34,
                  ),
                  SizedBox(
                    height: 88,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 56,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/delete_home.svg',
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  'Xóa tài khoản',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xfff2d3748),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showLogoutConfirmationDialog(AccountBloc bloc) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BlocProvider.value(
          value: bloc,
          child: BlocListener<AccountBloc, AccountState>(
            listener: (context, state) {
              if (state.status == AccountStatus.logoutsuccsess) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BlocProvider(
                              create: (context) => LoginBloc(),
                              child: const LoginPage(),
                            )));
              }
            },
            child: AlertDialog(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 50.0),
              backgroundColor: Colors.white,
              content: const Text(
                "Bạn có chắc chắn muốn đăng xuất không?",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
              actions: <Widget>[
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        bloc.add(LogoutAccountEvent());
                      },
                      child: Container(
                        height: 60,
                        width: 120,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                        child: const Center(
                          child: Text(
                            'Xác Nhận ',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: ColorsApp.backGroundColor),
                          ),
                        ),
                      ),
                    ),
                    Expanded(child: Container()),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: 60,
                        width: 120,
                        decoration: const BoxDecoration(
                            color: ColorsApp.backGroundColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                        child: const Center(
                          child: Text(
                            'Hủy bỏ ',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
