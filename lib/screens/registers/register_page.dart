import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import 'package:lua_v3/conponents/colors.dart';
import 'package:lua_v3/models/user_detail.dart';
import 'package:lua_v3/screens/acountpages/account_page.dart';
import 'package:lua_v3/screens/acountpages/bloc/account_bloc.dart';

import 'package:lua_v3/screens/login_pages/bloc/login_bloc.dart';
import 'package:lua_v3/screens/login_pages/bloc/login_state.dart';
import 'package:lua_v3/screens/registers/bloc/register_bloc.dart';
import 'package:lua_v3/screens/registers/bloc/register_event.dart';
import 'package:lua_v3/screens/registers/bloc/register_state.dart';
import 'package:lua_v3/screens/topics/bloc/topic_bloc.dart';
import 'package:lua_v3/screens/topics/topic_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? imageUrl;
  final ImagePicker _picker = ImagePicker();
  UserDetail userDetail = UserDetail();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  bool _isPhoneNumberValid(String phoneNumber) {
    return phoneNumber.isNotEmpty &&
        phoneNumber.startsWith('0') &&
        phoneNumber.length == 10;
  }

  String? selectedGender;
  String? fullNameError;
  String? genderError;
  String? phoneNumberError;
  String? addressError;

  File? _imageFile;
  late LoginBloc loginBloc;
  @override
  void initState() {
    loginBloc = BlocProvider.of<LoginBloc>(context);
    if (loginBloc.state is LoginSuccessState) {
      var state = loginBloc.state as LoginSuccessState;
      _fullNameController.text = state.userDetail?.full_name ?? '';
      _emailController.text = state.userDetail?.email ?? '';
      imageUrl = state.userDetail?.avatar;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Center(
            child: Text(
              'Thông tin cá nhân ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ),
        ),
        body: BlocListener<RegisterBloc, RegisterState>(
          listener: (context, state) async {
            if (state is RegistelStatelSuccess) {
              await Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BlocProvider(
                            create: (context) => AccountBloc(),
                            child: const AccountPage(),
                          )));
            }
          },
          child: BlocBuilder<LoginBloc, LoginState>(
            bloc: loginBloc,
            builder: (context, state) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 35),
                      Center(
                        child: SizedBox(
                          height: 98,
                          width: 98,
                          child: Stack(
                            children: [
                              Container(
                                height: 98,
                                width: 98,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: _imageFile != null
                                        ? DecorationImage(
                                            image: FileImage(_imageFile!),
                                            fit: BoxFit.cover,
                                          )
                                        : DecorationImage(
                                            image: NetworkImage(imageUrl ??
                                                'https://picsum.photos/250?image=9'),
                                            fit: BoxFit.cover,
                                          )),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: InkWell(
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
                                                  height: 200,
                                                  child: Column(
                                                    children: [
                                                      const Text('Chọn Ảnh',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 20)),
                                                      const SizedBox(
                                                        height: 32,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child: InkWell(
                                                              onTap: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                                _takePicture();
                                                              },
                                                              child: Container(
                                                                height: 52,
                                                                decoration:
                                                                    BoxDecoration(
                                                                        border: Border.all(
                                                                            color: ColorsApp
                                                                                .backGroundColor),
                                                                        color: ColorsApp
                                                                            .backGroundColor,
                                                                        borderRadius:
                                                                            const BorderRadius.all(
                                                                          Radius.circular(
                                                                              8),
                                                                        )),
                                                                child:
                                                                    const Center(
                                                                  child: Text(
                                                                    'Sử dụng camera',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 16,
                                                          ),
                                                          Expanded(
                                                            child: InkWell(
                                                              onTap: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                                _pickImage();
                                                              },
                                                              child: Container(
                                                                height: 52,
                                                                decoration:
                                                                    const BoxDecoration(
                                                                        color: ColorsApp
                                                                            .backGroundColor,
                                                                        borderRadius:
                                                                            BorderRadius.all(
                                                                          Radius.circular(
                                                                              8),
                                                                        )),
                                                                child:
                                                                    const Center(
                                                                  child: Text(
                                                                    'Chọn từ thư viện',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        color: Color(
                                                                            0xFFFFFFFF)),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ));
                                          },
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.transparent,
                                    ),
                                    child: SvgPicture.asset(
                                      'assets/icons/camera.svg',
                                      height: 40,
                                      width: 40,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 42),
                      Stack(
                        children: [
                          Column(
                            children: [
                              const SizedBox(height: 6),
                              TextField(
                                controller: _fullNameController,
                                onChanged: (value) {
                                  setState(() {
                                    fullNameError = value.isEmpty
                                        ? 'Vui lòng nhập họ và tên.'
                                        : null;
                                  });
                                },
                                decoration: InputDecoration(
                                  hintText: 'Nhập họ và tên',
                                  border: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xfffa0aec0)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  ),
                                  hintStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xfffa0aec0),
                                  ),
                                  errorText: fullNameError,
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            left: 12,
                            top: 0,
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              color: Colors.white,
                              child: RichText(
                                text: const TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Họ và tên ',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xfff2d3748),
                                      ),
                                    ),
                                    TextSpan(
                                      text: '*',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      Container(
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                const SizedBox(height: 6),
                                TextField(
                                  enabled: false,
                                  controller: TextEditingController(
                                      text: selectedGender),
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xfffa0aec0)),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                    ),
                                    errorText: genderError,
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              right: 16,
                              top: 10,
                              child: SizedBox(
                                child: DropdownButton<String>(
                                  onChanged: (String? value) {
                                    setState(() {
                                      selectedGender = value;
                                      genderError = null;
                                    });
                                  },
                                  underline: Container(),
                                  items: <String>['male', 'female', 'unknown']
                                      .map<DropdownMenuItem<String>>(
                                    (String? value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Container(
                                          width: 60,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(8),
                                            ),
                                            color: value == selectedGender
                                                ? const Color.fromARGB(
                                                        255, 196, 200, 204)
                                                    .withOpacity(0.5)
                                                : null,
                                          ),
                                          child: Center(
                                            child: Text(
                                              value ?? 'Chọn',
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ).toList(),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 12,
                              top: 0,
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                color: Colors.white,
                                child: RichText(
                                  text: const TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Giới tính',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xfff2d3748),
                                        ),
                                      ),
                                      TextSpan(
                                        text: '*',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.red,
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
                      const SizedBox(height: 32),
                      Container(
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                const SizedBox(height: 6),
                                TextField(
                                  controller: _phoneNumberController,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(10),
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      if (_isPhoneNumberValid(value.trim())) {
                                        phoneNumberError = null;
                                      } else {
                                        phoneNumberError =
                                            'Vui lòng nhập số điện thoại hợp lệ.';
                                      }
                                    });
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Nhập số điện thoại',
                                    border: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xfffa0aec0)),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                    ),
                                    hintStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xfffa0aec0),
                                    ),
                                    errorText: phoneNumberError,
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              left: 12,
                              top: 0,
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                color: Colors.white,
                                child: RichText(
                                  text: const TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Số điện thoại ',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xfff2d3748),
                                        ),
                                      ),
                                      TextSpan(
                                        text: '*',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.red,
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
                      const SizedBox(height: 32),
                      Container(
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                const SizedBox(height: 6),
                                TextField(
                                  controller: _addressController,
                                  onChanged: (value) {
                                    setState(() {
                                      addressError = value.isEmpty
                                          ? 'Vui lòng nhập địa chỉ.'
                                          : null;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Nhập địa chỉ của bạn',
                                    border: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xfffa0aec0)),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                    ),
                                    hintStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xfffa0aec0),
                                    ),
                                    errorText: addressError,
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              left: 12,
                              top: 0,
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                color: Colors.white,
                                child: RichText(
                                  text: const TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Địa chỉ',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xfff2d3748),
                                        ),
                                      ),
                                      TextSpan(
                                        text: '*',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.red,
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
                      const SizedBox(height: 32),
                      Container(
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                const SizedBox(height: 6),
                                TextField(
                                  enabled: false,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xfffa0aec0)),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                    ),
                                    hintStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xfffa0aec0),
                                    ),
                                  ),
                                  controller: _emailController,
                                ),
                              ],
                            ),
                            Positioned(
                              left: 12,
                              top: 0,
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                color: Colors.white,
                                child: RichText(
                                  text: const TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Email',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xfff2d3748),
                                        ),
                                      ),
                                      TextSpan(
                                        text: '*',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.red,
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
                      const SizedBox(height: 32),
                      TextButton(
                        onPressed: () async {
                          setState(() {
                            fullNameError = _fullNameController.text.isEmpty
                                ? 'Vui lòng nhập họ và tên.'
                                : null;
                            genderError = selectedGender == null
                                ? 'Vui lòng chọn giới tính.'
                                : null;
                            phoneNumberError = !_isPhoneNumberValid(
                                    _phoneNumberController.text.trim())
                                ? 'Vui lòng nhập số điện thoại hợp lệ.'
                                : null;
                            addressError = _addressController.text.isEmpty
                                ? 'Vui lòng nhập địa chỉ.'
                                : null;

                            if (fullNameError == null &&
                                genderError == null &&
                                phoneNumberError == null &&
                                addressError == null) {
                              userDetail = UserDetail(
                                avatar:
                                    _imageFile != null ? _imageFile!.path : '',
                                full_name: _fullNameController.text,
                                gender: selectedGender ?? '',
                                phone_number: _phoneNumberController.text,
                                address: _addressController.text,
                                email: '',
                              );
                              print(userDetail);
                              BlocProvider.of<RegisterBloc>(context).add(
                                  SubmitRegisterEvent(userDetail: userDetail));
                            }
                          });
                        },
                        style: TextButton.styleFrom(
                          minimumSize: const Size(390, 56),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          backgroundColor: ColorsApp.backGroundColor,
                        ),
                        child: const Text(
                          'Xác nhận',
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
          ),
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
        userDetail.avatar = _imageFile!.path;
      }
    });
  }

  Future<void> _takePicture() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
        userDetail.avatar = _imageFile!.path;
      }
    });
  }
}
