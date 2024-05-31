import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lua_v3/conponents/colors.dart';
import 'package:lua_v3/models/coach_detail.dart';
import 'package:lua_v3/screens/home_page/bloc/home_bloc.dart';
import 'package:lua_v3/screens/home_page/bloc/home_event.dart';
import 'package:lua_v3/screens/home_page/bloc/home_state.dart';
import 'package:lua_v3/screens/home_page/category.dart';
import 'package:lua_v3/screens/home_page/famous_coach/detail_coach/bloc/detail_coach_bloc.dart';
import 'package:lua_v3/screens/home_page/page_view.dart';
import 'package:lua_v3/screens/home_page/propose_page.dart';
import 'package:lua_v3/screens/home_page/top_video_month.dart';
import 'package:lua_v3/screens/seach_page/seach_page.dart';

import 'famous_coach/detail_coach/famous_coach.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? fullName = '';
  String? avatar = '';
  List<CoachDetail>? coachDetail;
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(ChosseHomeEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (state.status == HomeStatus.success) {
        fullName = state.userDetail?.full_name ?? 'user';
        avatar = state.userDetail?.avatar ?? '';
        coachDetail = state.coachDetail;
      } else {}
      return Scaffold(
        body: Column(
          children: [
            Container(
              height: 132,
              decoration: const BoxDecoration(
                color: ColorsApp.backGroundColor,
              ),
              padding: const EdgeInsets.only(top: 60, right: 18, left: 18),
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset('assets/icons/first_home.svg'),
                    const SizedBox(width: 8),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 4,
                          ),
                          Center(
                            child: Text(
                              'Xin chào $fullName ',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                          ),
                          const Center(
                            child: Text(
                              'Bạn đã sẵn sàng?',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(child: Container()),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SeachPage(),
                              ),
                            );
                          },
                          child:
                              SvgPicture.asset('assets/icons/seach_home.svg'),
                        ),
                        const SizedBox(width: 8),
                        SvgPicture.asset('assets/icons/bell_home.svg'),
                      ],
                    )
                  ],
                ),
              ),
            ),

            ///////////////////////
            Expanded(
              child: Stack(
                children: [
                  Container(
                    height: 137,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(8),
                          bottomLeft: Radius.circular(8)),
                      color: ColorsApp.backGroundColor,
                    ),
                  ),
                  SingleChildScrollView(
                    child: SizedBox(
                      child: Column(
                        children: [
                          const PageViews(),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            color: Colors.white,
                            child: Column(
                              children: [
                                const Category(),
                                const SizedBox(
                                  height: 8,
                                ),
                                FamousCoach(coachDetail: coachDetail),
                                const SizedBox(
                                  height: 8,
                                ),
                                const TopVideoMonth(),
                                const SizedBox(
                                  height: 8,
                                ),
                                const ProposePage(),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
