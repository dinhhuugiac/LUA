import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import 'package:lua_v3/conponents/colors.dart';
import 'package:lua_v3/models/user_detail.dart';
import 'package:lua_v3/screens/acountpages/bloc/account_bloc.dart';
import 'package:lua_v3/screens/acountpages/bloc/account_state.dart';
import 'package:lua_v3/screens/acountpages/account_page.dart';
import 'package:lua_v3/screens/setting_page/setting_page.dart';

import 'package:lua_v3/screens/update_pages/bloc/update_bloc.dart';
import 'package:lua_v3/screens/update_pages/bloc/update_event.dart';
import 'package:lua_v3/screens/update_pages/bloc/update_state.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage({Key? key}) : super(key: key);

  @override
  State<UpdatePage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<UpdatePage> {
  String? imageUrl;
  final ImagePicker _picker = ImagePicker();
  UserDetail userDetail = UserDetail();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();

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
  late AccountBloc homeBloc;
  @override
  void initState() {
    homeBloc = BlocProvider.of<AccountBloc>(context);
    if (homeBloc.state.status == AccountStatus.success) {
      var state = homeBloc.state;
      _fullNameController.text = state.userDetail?.full_name ?? '';
      _emailController.text = state.userDetail?.email ?? '';
      imageUrl = state.userDetail?.avatar;
      _addressController.text = state.userDetail?.address ?? '';
      _phoneNumberController.text = state.userDetail?.phone_number ?? '';
      _genderController.text = state.userDetail?.gender ?? '';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: BlocConsumer<UpdateBloc, UpdateState>(
          listener: (context, updatestate) {},
          builder: (context, updatestate) {
            return BlocConsumer<UpdateBloc, UpdateState>(
              listener: (context, updatestate) {},
              builder: (context, updatestate) {
                return Stack(
                  children: [
                    Container(
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
                        body: BlocListener<UpdateBloc, UpdateState>(
                          listener: (context, updatestate) async {
                            if (updatestate.status == UpdateStatus.success) {
                              await Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BlocProvider(
                                            create: (context) => AccountBloc(),
                                            child: const SettingPage(),
                                          )));
                            }
                            //  Navigator.pop(
                            //       context); // pop ra khỏi trang hiện tại
                            // }
                          },
                          child: BlocBuilder<AccountBloc, AccountState>(
                            bloc: homeBloc,
                            builder: (context, homestate) {
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
                                                            image: FileImage(
                                                                _imageFile!),
                                                            fit: BoxFit.cover,
                                                          )
                                                        : DecorationImage(
                                                            image: NetworkImage(
                                                                imageUrl ??
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
                                                      builder: (BuildContext
                                                          context) {
                                                        return StatefulBuilder(
                                                          builder: (BuildContext
                                                                  context,
                                                              StateSetter
                                                                  setState) {
                                                            return Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        left:
                                                                            16,
                                                                        right:
                                                                            16,
                                                                        top: 16,
                                                                        bottom:
                                                                            35),
                                                                child: SizedBox(
                                                                  height: 200,
                                                                  child: Column(
                                                                    children: [
                                                                      const Text(
                                                                          'Chọn Ảnh',
                                                                          style: TextStyle(
                                                                              color: Colors.black,
                                                                              fontSize: 20)),
                                                                      const SizedBox(
                                                                        height:
                                                                            64,
                                                                      ),
                                                                      Row(
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                InkWell(
                                                                              onTap: () {
                                                                                Navigator.of(context).pop();
                                                                                _takePicture();
                                                                              },
                                                                              child: Container(
                                                                                height: 52,
                                                                                decoration: BoxDecoration(
                                                                                    border: Border.all(color: ColorsApp.backGroundColor),
                                                                                    color: ColorsApp.backGroundColor,
                                                                                    borderRadius: const BorderRadius.all(
                                                                                      Radius.circular(8),
                                                                                    )),
                                                                                child: const Center(
                                                                                  child: Text(
                                                                                    'Sử dụng camera',
                                                                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          const SizedBox(
                                                                            width:
                                                                                16,
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                InkWell(
                                                                              onTap: () {
                                                                                Navigator.of(context).pop();
                                                                                _pickImage();
                                                                              },
                                                                              child: Container(
                                                                                height: 52,
                                                                                decoration: const BoxDecoration(
                                                                                    color: ColorsApp.backGroundColor,
                                                                                    borderRadius: BorderRadius.all(
                                                                                      Radius.circular(8),
                                                                                    )),
                                                                                child: const Center(
                                                                                  child: Text(
                                                                                    'Chọn từ thư viện',
                                                                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Color(0xFFFFFFFF)),
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
                                                    decoration:
                                                        const BoxDecoration(
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
                                                    fullNameError = value
                                                            .isEmpty
                                                        ? 'Vui lòng nhập họ và tên.'
                                                        : null;
                                                  });
                                                },
                                                cursorColor:
                                                    ColorsApp.backGroundColor,
                                                decoration: InputDecoration(
                                                  hintText: 'Nhập họ và tên',
                                                  focusedBorder:
                                                      const OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          8)),
                                                          borderSide: BorderSide(
                                                              color: ColorsApp
                                                                  .backGroundColor)),
                                                  border:
                                                      const OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(8)),
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
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 4),
                                              color: Colors.white,
                                              child: RichText(
                                                text: const TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: 'Họ và tên ',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color:
                                                            Color(0xfff2d3748),
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
                                                  cursorColor:
                                                      ColorsApp.backGroundColor,
                                                  controller: _genderController,
                                                  decoration: InputDecoration(
                                                    border:
                                                        const OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0xfffa0aec0),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(8),
                                                      ),
                                                    ),
                                                    focusedBorder:
                                                        const OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: ColorsApp
                                                            .backGroundColor,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(8),
                                                      ),
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

                                                      _genderController.text =
                                                          value ?? '';
                                                    });
                                                  },
                                                  underline: Container(),
                                                  items: <String>[
                                                    'male',
                                                    'female',
                                                    'unknown'
                                                  ].map<
                                                      DropdownMenuItem<String>>(
                                                    (String? value) {
                                                      return DropdownMenuItem<
                                                          String>(
                                                        value: value,
                                                        child: Container(
                                                          width: 60,
                                                          height: 30,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .all(
                                                              Radius.circular(
                                                                  8),
                                                            ),
                                                            color: value ==
                                                                    selectedGender
                                                                ? const Color
                                                                        .fromARGB(
                                                                        255,
                                                                        196,
                                                                        200,
                                                                        204)
                                                                    .withOpacity(
                                                                        0.5)
                                                                : null,
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              value ?? '',
                                                              style:
                                                                  const TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
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
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 4),
                                                color: Colors.white,
                                                child: RichText(
                                                  text: const TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: 'Giới tính',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Color(
                                                              0xfff2d3748),
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
                                                  cursorColor:
                                                      ColorsApp.backGroundColor,
                                                  controller:
                                                      _phoneNumberController,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  inputFormatters: [
                                                    FilteringTextInputFormatter
                                                        .digitsOnly,
                                                    LengthLimitingTextInputFormatter(
                                                        10),
                                                  ],
                                                  onChanged: (value) {
                                                    setState(() {
                                                      if (_isPhoneNumberValid(
                                                          value.trim())) {
                                                        phoneNumberError = null;
                                                      } else {
                                                        phoneNumberError =
                                                            'Vui lòng nhập số điện thoại hợp lệ.';
                                                      }
                                                    });
                                                  },
                                                  decoration: InputDecoration(
                                                    hintText:
                                                        'Nhập số điện thoại',
                                                    focusedBorder:
                                                        const OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            8)),
                                                            borderSide: BorderSide(
                                                                color: ColorsApp
                                                                    .backGroundColor)),
                                                    border:
                                                        const OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  8)),
                                                    ),
                                                    hintStyle: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
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
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 4),
                                                color: Colors.white,
                                                child: RichText(
                                                  text: const TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: 'Số điện thoại ',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Color(
                                                              0xfff2d3748),
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
                                                  cursorColor:
                                                      ColorsApp.backGroundColor,
                                                  controller:
                                                      _addressController,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      addressError = value
                                                              .isEmpty
                                                          ? 'Vui lòng nhập địa chỉ.'
                                                          : null;
                                                    });
                                                  },
                                                  decoration: InputDecoration(
                                                    hintText:
                                                        'Nhập địa chỉ của bạn',
                                                    focusedBorder:
                                                        const OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            8)),
                                                            borderSide: BorderSide(
                                                                color: ColorsApp
                                                                    .backGroundColor)),
                                                    border:
                                                        const OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  8)),
                                                    ),
                                                    hintStyle: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
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
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 4),
                                                color: Colors.white,
                                                child: RichText(
                                                  text: const TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: 'Địa chỉ',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Color(
                                                              0xfff2d3748),
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
                                                  decoration:
                                                      const InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  8)),
                                                    ),
                                                    hintStyle: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
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
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 4),
                                                color: Colors.white,
                                                child: RichText(
                                                  text: const TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: 'Email',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Color(
                                                              0xfff2d3748),
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
                                            fullNameError =
                                                _fullNameController.text.isEmpty
                                                    ? 'Vui lòng nhập họ và tên.'
                                                    : null;

                                            phoneNumberError = !_isPhoneNumberValid(
                                                    _phoneNumberController.text
                                                        .trim())
                                                ? 'Vui lòng nhập số điện thoại hợp lệ.'
                                                : null;
                                            addressError =
                                                _addressController.text.isEmpty
                                                    ? 'Vui lòng nhập địa chỉ.'
                                                    : null;

                                            if (fullNameError == null &&
                                                genderError == null &&
                                                phoneNumberError == null &&
                                                addressError == null) {
                                              userDetail = UserDetail(
                                                avatar: _imageFile != null
                                                    ? _imageFile!.path
                                                    : '',
                                                full_name:
                                                    _fullNameController.text,
                                                gender: selectedGender ?? '',
                                                phone_number:
                                                    _phoneNumberController.text,
                                                address:
                                                    _addressController.text,
                                                email: '',
                                              );
                                              BlocProvider.of<UpdateBloc>(
                                                      context)
                                                  .add(UpdateInforEvent(
                                                      userDetail: userDetail));
                                              print(userDetail);
                                            }
                                          });
                                        },
                                        style: TextButton.styleFrom(
                                          minimumSize: const Size(390, 56),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          backgroundColor:
                                              ColorsApp.backGroundColor,
                                        ),
                                        child: const Text(
                                          'Lưu',
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
                    ),
                    if (updatestate.status == UpdateStatus.submit)
                      Container(
                        decoration:
                            BoxDecoration(color: Colors.black.withOpacity(0.5)),
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: ColorsApp.backGroundColor,
                          ),
                        ),
                      ),
                  ],
                );
              },
            );
          },
        ));
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
