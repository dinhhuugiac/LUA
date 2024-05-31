import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lua_v3/conponents/colors.dart';
import 'package:lua_v3/screens/home_page/famous_coach/evaluation_coach.dart';
import 'package:lua_v3/screens/home_page/famous_coach/course.dart';

class DetailCoachPage extends StatefulWidget {
  const DetailCoachPage({Key? key}) : super(key: key);

  @override
  State<DetailCoachPage> createState() => _DetailCoachPageState();
}

class _DetailCoachPageState extends State<DetailCoachPage> {
  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 367,
                ),
                Container(
                  height: 220,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/cover_image.png'))),
                ),
                Positioned(
                  left: 23,
                  top: 55,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      child: SvgPicture.asset('assets/icons/button_detail.svg'),
                    ),
                  ),
                ),
                Positioned(
                  top: 153,
                  left: 110,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 113,
                          width: 113,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      AssetImage('assets/images/coach.png'))),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Text(
                          'Dương Amy',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Color(0xfff212b36)),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const EvaluationCoachPage(),
                                ),
                              );
                            },
                            child:
                                SvgPicture.asset('assets/icons/start_icon.svg'))
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sed vel turpis adipiscing penatibus orci neque. Erat sed fermentum ipsum vel quis quam. Nunc etiam dui tortor, non in aliquam lacinia tempor.Sed vel turpis adipiscing penatibus orci neque. Erat sed fermentum ipsum vel quis quam. Nunc etiam dui tortor, non in aliquam lacinia tempor.Sed vel turpis adipiscing penatibus orci neque. Erat sed fermentum ipsum vel quis quam. Nunc etiam dui tortor, non in aliquam lacinia tempor.Sed vel turpis adipiscing penatibus orci neque. Erat sed fermentum ipsum vel quis quam. Nunc etiam dui tortor, non in aliquam lacinia tempor.',
                    maxLines: _isExpanded ? 4 : 20,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffff718096)),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _isExpanded = !_isExpanded;
                      });
                    },
                    child: Text(
                      _isExpanded ? 'Xem thêm' : 'Thu gọn',
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: ColorsApp.backGroundColor),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                      height: 190,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xfffe2e8f0),
                            width: 1.0,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 35,
                              child: Row(children: [
                                SvgPicture.asset('assets/icons/grid.svg'),
                                const SizedBox(
                                  width: 8,
                                ),
                                const Text(
                                  'Thể loại :',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black),
                                ),
                                Expanded(child: Container()),
                                const Center(
                                  child: Text(
                                    'Yoga - Fitness -\n Mindfulness',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black),
                                  ),
                                )
                              ]),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(children: [
                              SvgPicture.asset('assets/icons/eye_black.svg'),
                              const SizedBox(
                                width: 8,
                              ),
                              const Text(
                                'Lượt xem :',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black),
                              ),
                              Expanded(child: Container()),
                              const Text(
                                '1.000.000.000',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              )
                            ]),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(children: [
                              SvgPicture.asset('assets/icons/play list.svg'),
                              const SizedBox(
                                width: 8,
                              ),
                              const Text(
                                'Số khóa học :',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black),
                              ),
                              Expanded(child: Container()),
                              const Text(
                                '15 Khoá học',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              )
                            ]),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(children: [
                              SvgPicture.asset('assets/icons/ytb.svg'),
                              const SizedBox(
                                width: 8,
                              ),
                              const Text(
                                'Số bài học :',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black),
                              ),
                              Expanded(child: Container()),
                              const Text(
                                '90 Bài học',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              )
                            ]),
                          ],
                        ),
                      )),
                  const SizedBox(
                    height: 16,
                  ),
                  const Center(
                    child: Text(
                      'Tập luyện cùng \n Dương Amy',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Color(0xffff1a202c)),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      const Text(
                        'Bài học - Khoá học của HLV',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xffff0f172a)),
                      ),
                      Expanded(child: Container()),
                      const Text(
                        'xem thêm ',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffff4a5568)),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CoursePage(),
                        ),
                      );
                    },
                    child: Stack(children: [
                      Container(
                        height: 220,
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadiusDirectional.all(Radius.circular(8)),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    'assets/images/video_detail.png'))),
                      ),
                      Positioned(
                        right: 8,
                        bottom: 8,
                        child: Container(
                          width: 43,
                          height: 28,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8))),
                          child: const Center(
                            child: Text(
                              '15:00',
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ]),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Làm sao để bắt đầu tập Yoga cho người mới năm 2024',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xfff2d3748)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
