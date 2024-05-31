import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:intl/intl.dart';
import 'package:lua_v3/conponents/colors.dart';
import 'package:lua_v3/models/subscription_course.dart';
import 'package:lua_v3/screens/home_page/famous_coach/course.dart';
import 'package:lua_v3/screens/home_page/famous_coach/open_courses/bloc/course_bloc.dart';
import 'package:lua_v3/screens/home_page/famous_coach/open_courses/bloc/course_event.dart';
import 'package:lua_v3/screens/home_page/famous_coach/open_courses/bloc/course_state.dart';

class OpenCourse extends StatefulWidget {
  const OpenCourse({Key? key}) : super(key: key);

  @override
  State<OpenCourse> createState() => _OpenCourseState();
}

class _OpenCourseState extends State<OpenCourse> {
  int selectedContainerIndex = 0;
  NumberFormat formatter = NumberFormat.decimalPattern('vi-VN');

  @override
  void initState() {
    super.initState();
    context.read<DescribeCourseBloc>().add(const InitDescribeCourseEvent());
  }

  List<Course>? listData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<DescribeCourseBloc, DescribeCourseState>(
        listener: (context, state) {
          if (state.status == DescribeCourseStatus.success) {
            listData = state.listData;
          }
        },
        child: BlocBuilder<DescribeCourseBloc, DescribeCourseState>(
            builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                const SizedBox(height: 44),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(
                        'assets/icons/chevron-left.svg',
                        height: 24,
                        width: 24,
                      ),
                    ),
                    const SizedBox(width: 100),
                    const Center(
                      child: Text(
                        'Gói đăng ký',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                (state.status == DescribeCourseStatus.loading)
                    ? Expanded(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      )
                    : (state.status == DescribeCourseStatus.success)
                        ? Expanded(
                            child: SingleChildScrollView(
                              child: (Column(
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        'Chọn gói đăng ký',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xffff718096),
                                        ),
                                      ),
                                      Expanded(child: Container()),
                                      const Text(
                                        '*Đơn vị : VNĐ',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xffff718096),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: SizedBox(
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      selectedContainerIndex =
                                                          0;
                                                    });
                                                  },
                                                  child: Container(
                                                    key: ValueKey(
                                                        listData?[0].id ?? ''),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: selectedContainerIndex ==
                                                                0
                                                            ? ColorsApp
                                                                .backGroundColor
                                                            : const Color(
                                                                0xffffcbd5e0),
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .all(
                                                        Radius.circular(8),
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        right: 16,
                                                        left: 16,
                                                        bottom: 16,
                                                        top: 24,
                                                      ),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            listData?[0]
                                                                    .title ??
                                                                '',
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color: Color(
                                                                  0xffff2d3748),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 24,
                                                          ),
                                                          Text(
                                                            formatter.format(
                                                                listData?[0]
                                                                        .price ??
                                                                    0),
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 29,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: Color(
                                                                  0xffff2d3748),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 4,
                                                          ),
                                                          Text(
                                                            listData?[0]
                                                                    .title ??
                                                                '',
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: Color(
                                                                  0xffff2d3748),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 24,
                                                          ),
                                                          Text(
                                                            '${formatter.format(listData?[0].price ?? 0 / 12)}đ/tháng',
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: Color(
                                                                  0xffff2d3748),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 16,
                                              ),
                                              Expanded(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      selectedContainerIndex =
                                                          1;
                                                    });
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: selectedContainerIndex ==
                                                                1
                                                            ? ColorsApp
                                                                .backGroundColor
                                                            : const Color(
                                                                0xffffcbd5e0),
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .all(
                                                        Radius.circular(8),
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        right: 16,
                                                        left: 16,
                                                        bottom: 16,
                                                        top: 24,
                                                      ),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            listData?[1]
                                                                    .title ??
                                                                '',
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color: Color(
                                                                  0xffff2d3748),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 24,
                                                          ),
                                                          Text(
                                                            formatter.format(
                                                                listData?[1]
                                                                        .price ??
                                                                    0),
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 29,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: Color(
                                                                  0xffff2d3748),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 4,
                                                          ),
                                                          Text(
                                                            listData?[1]
                                                                    .title ??
                                                                '',
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: Color(
                                                                  0xffff2d3748),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 24,
                                                          ),
                                                          const Text('')
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      if (selectedContainerIndex == 0)
                                        Positioned(
                                          left: 26,
                                          child: Container(
                                            height: 33,
                                            decoration: const BoxDecoration(
                                              color: ColorsApp.backGroundColor,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(4),
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 12,
                                                  right: 12,
                                                  top: 8,
                                                  bottom: 8),
                                              child: Text(
                                                'Tiết kiệm ${listData?[0].discount ?? ''}%',
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 32,
                                  ),
                                  if (selectedContainerIndex == 0)
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                              color: const Color(0xffffdfe3e8)),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(8))),
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                margin: const EdgeInsets.only(
                                                    top: 4),
                                                decoration: const BoxDecoration(
                                                  border: Border(
                                                    bottom: BorderSide(
                                                      color: Color(0xfffedf2f7),
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                ),
                                                child: HtmlWidget(
                                                    listData?[0].description ??
                                                        '')),
                                          ],
                                        ),
                                      ),
                                    ),
                                  if (selectedContainerIndex == 1)
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color(0xffffdfe3e8)),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(8))),
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              margin:
                                                  const EdgeInsets.only(top: 4),
                                              decoration: const BoxDecoration(
                                                border: Border(
                                                  bottom: BorderSide(
                                                    color: Color(0xfffedf2f7),
                                                    width: 1.0,
                                                  ),
                                                ),
                                              ),
                                              child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  margin: const EdgeInsets.only(
                                                      top: 4),
                                                  decoration:
                                                      const BoxDecoration(
                                                    border: Border(
                                                      bottom: BorderSide(
                                                        color:
                                                            Color(0xfffedf2f7),
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                  ),
                                                  child: HtmlWidget(listData?[1]
                                                          .description ??
                                                      '')),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  const Text('7 ngày trải nghiệm miễn phí',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: ColorsApp.backGroundColor,
                                      )),
                                  const SizedBox(
                                    height: 32,
                                  ),
                                  const Text(
                                      'Điều khoản sử dụng - Chính sách bảo mật',
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xffff718096),
                                      )),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                ],
                              )),
                            ),
                          )
                        : const Text('ERRRORRR'),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CoursePage(),
                      ),
                    );
                  },
                  child: Container(
                    height: 52,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        color: ColorsApp.backGroundColor,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: const Center(
                      child: Text('Xác nhận',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          )),
                    ),
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
