import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({Key? key}) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text('Custom TextField')),
      body: const Center(child: CustomTextField()),
    ),
  ));
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const TextField(
          decoration: InputDecoration(
              hintText: 'Nhập họ và tên',
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xfffa0aec0)),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              hintStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xfffa0aec0))),
        ),
        Positioned(
          left: 12,
          top: -4,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4),
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
    );
  }
}
