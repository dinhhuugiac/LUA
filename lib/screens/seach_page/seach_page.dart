import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lua_v3/conponents/colors.dart';

class SeachPage extends StatefulWidget {
  const SeachPage({Key? key}) : super(key: key);

  @override
  State<SeachPage> createState() => _SeachpageState();
}

class _SeachpageState extends State<SeachPage> {
  final TextEditingController _textEditingController = TextEditingController();
  bool _isTextFieldFocused = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isTextFieldFocused = false;
        });
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Tìm kiếm ',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Container(
                  height: 56,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    border: Border.all(
                      color: _isTextFieldFocused
                          ? ColorsApp.backGroundColor
                          : const Color(0xfff2d3748),
                    ),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 8,
                      ),
                      SvgPicture.asset('assets/icons/seach_home.svg'),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _isTextFieldFocused = true;
                            });
                          },
                          child: TextField(
                            controller: _textEditingController,
                            onTap: () {
                              setState(() {
                                _isTextFieldFocused = true;
                              });
                            },
                            onChanged: (value) {
                              if (value.isEmpty) {
                                setState(() {
                                  _isTextFieldFocused = false;
                                });
                              }
                            },
                            cursorColor: ColorsApp.backGroundColor,
                            decoration: const InputDecoration(
                              hintText: 'Bài học, Khóa học,...',
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xfffa0aec0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 400),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Tìm kiếm khóa học \n hoặc bài học mong muốn',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Color(0xfff2d3748)),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
