import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lua_v3/conponents/colors.dart';
import 'package:lua_v3/screens/acountpages/account_page.dart';
import 'package:lua_v3/screens/acountpages/bloc/account_bloc.dart';
import 'package:lua_v3/screens/home_page/bloc/home_bloc.dart';
import 'package:lua_v3/screens/home_page/home_page.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  int _selectedIndex = 0;
  late PageController _pageController;

  final List<SvgPicture> _selectedIcons = [
    SvgPicture.asset('assets/icons/home_green.svg'),
    SvgPicture.asset('assets/icons/home_green.svg'),
    SvgPicture.asset('assets/icons/home_green.svg'),
    SvgPicture.asset('assets/icons/person_green_home.svg'),
  ];

  final List<SvgPicture> _unselectedIcons = [
    SvgPicture.asset('assets/icons/house_home.svg'),
    SvgPicture.asset('assets/icons/house_home.svg'),
    SvgPicture.asset('assets/icons/house_home.svg'),
    SvgPicture.asset('assets/icons/person_home.svg'),
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      if (_selectedIndex != index) {
        _selectedIndex = index;
        _pageController.jumpToPage(index);
      } else if (_selectedIndex == 3) {
        _pageController.jumpToPage(_selectedIndex);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: PageStorageBucket(),
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
            print('sdsdsdsdsdsd s : $index');
          },
          children: <Widget>[
            BlocProvider(
              create: (context) => HomeBloc(),
              child: const HomePage(),
            ),
            const Center(child: Text('Profile')),
            const Center(child: Text('Notifications')),
            BlocProvider(
              create: (context) => AccountBloc(),
              child: const AccountPage(),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 95,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            4,
            (index) => GestureDetector(
              onTap: () => _onItemTapped(index),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Transform.scale(
                    scale: 1.0,
                    child: _selectedIndex == index
                        ? _selectedIcons[index]
                        : _unselectedIcons[index],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _getLabelText(index),
                    style: TextStyle(
                        fontSize: 12,
                        color: _getLabelColor(index),
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _getLabelText(int index) {
    switch (index) {
      case 0:
        return 'Trang chủ';
      case 1:
        return 'Luyện tập';
      case 2:
        return 'Bài viết';
      case 3:
        return 'Tài khoản';
      default:
        return '';
    }
  }

  Color _getLabelColor(int index) {
    return _selectedIndex == index
        ? ColorsApp.backGroundColor
        : const Color(0xffff718096);
  }
}
