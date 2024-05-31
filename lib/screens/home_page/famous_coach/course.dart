import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lua_v3/conponents/colors.dart';
import 'package:lua_v3/screens/home_page/famous_coach/evaluation_lesson.dart';
import 'package:lua_v3/screens/home_page/famous_coach/intro_video.dart';
import 'package:lua_v3/screens/home_page/famous_coach/open_courses/bloc/course_bloc.dart';
import 'package:lua_v3/screens/home_page/famous_coach/open_courses/open_course.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _IntroVideoPageState();
}

class _IntroVideoPageState extends State<CoursePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 44,
              ),
              Stack(
                children: [
                  Container(
                    height: 235,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image:
                                AssetImage('assets/images/cover_image.png'))),
                  ),
                  Positioned(
                    left: 16,
                    top: 11,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        child:
                            SvgPicture.asset('assets/icons/button_detail.svg'),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const Center(
                child: Text(
                  'Học yoga',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Color(0xffff1a202c)),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Center(
                child: Text(
                  'Dương Amy',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffff1a202c)),
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
                        builder: (context) => const EvaluationLessonPage(),
                      ),
                    );
                  },
                  child: Center(
                      child: SvgPicture.asset('assets/icons/start_icon.svg'))),
              const SizedBox(
                height: 16,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const IntroVideo(),
                    ),
                  );
                },
                child: Container(
                  height: 52,
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorsApp.backGroundColor),
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  child: const Center(
                    child: Text(
                      'Video giới thiệu',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: ColorsApp.backGroundColor),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (context) => DescribeCourseBloc(),
                        child: const OpenCourse(),
                      ),
                    ),
                  );
                },
                child: Container(
                  height: 52,
                  decoration: const BoxDecoration(
                    color: ColorsApp.backGroundColor,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: const Center(
                    child: Text(
                      'Mở khóa',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xfffffffff)),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 56,
              ),
              const Text(
                'Tổng quan',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              Container(
                  height: 144,
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
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              'assets/icons/play_icon.svg'),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          const Text(
                                            'Tổng thời lượng',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      const Row(
                                        children: [
                                          SizedBox(
                                            width: 32,
                                          ),
                                          Text(
                                            '30 phút',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Expanded(child: Container()),
                            SizedBox(
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              'assets/icons/bar-chart.svg',
                                              height: 24,
                                              width: 24),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          const Text(
                                            'Cấp độ',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      const Row(
                                        children: [
                                          SizedBox(
                                            width: 32,
                                          ),
                                          Text(
                                            'Cơ bản',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Expanded(child: Container()),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              'assets/icons/grid.svg'),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          const Text(
                                            'Thể loại',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      const Row(
                                        children: [
                                          SizedBox(
                                            width: 32,
                                          ),
                                          Text(
                                            'Yoga',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Expanded(child: Container()),
                            SizedBox(
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              'assets/icons/eye_black.svg'),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          const Text(
                                            'Lượt xem',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      const Row(
                                        children: [
                                          SizedBox(
                                            width: 32,
                                          ),
                                          Text(
                                            '100',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Giới thiệu lớp học',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                'Sed vel turpis adipiscing penatibus orci neque. Erat sed fermentum ipsum vel quis quam. Nunc etiam dui tortor, non in aliquam lacinia tempor.Sed vel turpis adipiscing penatibus orci neque. Erat sed fermentum ipsum vel quis quam. Nunc etiam dui tortor, non in aliquam lacinia tempor.Sed vel turpis adipiscing penatibus orci neque. Erat sed fermentum ipsum vel quis quam. Nunc etiam dui tortor, non in aliquam lacinia tempor.Sed vel turpis adipiscing penatibus orci neque. Erat sed fermentum ipsum vel quis quam. Nunc etiam dui tortor, non in aliquam lacinia tempor.',
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffff718096)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
