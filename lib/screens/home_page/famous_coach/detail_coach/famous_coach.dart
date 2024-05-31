import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lua_v3/models/coach_detail.dart';
import 'package:lua_v3/screens/home_page/famous_coach/detail_coach.dart';
import 'package:lua_v3/screens/home_page/famous_coach/see_more.dart';

class FamousCoach extends StatefulWidget {
  final List<CoachDetail>? coachDetail;
  const FamousCoach({super.key, this.coachDetail});

  @override
  State<FamousCoach> createState() => _FamousCoachState();
}

class _FamousCoachState extends State<FamousCoach> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 18, left: 18),
          child: Row(
            children: [
              const Text(
                'Huấn luyện viên nổi bật',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xfff0f172a),
                ),
              ),
              Expanded(child: Container()),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SeeMorePage(),
                    ),
                  );
                },
                child: const Text(
                  'xem thêm ',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xfff4a5568),
                  ),
                ),
              )
            ],
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DetailCoachPage(),
              ),
            );
          },
          child: SizedBox(
            height: 262,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 1),
                itemCount: widget.coachDetail?.length,
                itemBuilder: (context, index) => Column(
                      key: Key(widget.coachDetail?[index].id ?? ''),
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 16, top: 8, bottom: 16, left: 16),
                          child: SizedBox(
                            width: 157,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 157,
                                  width: 157,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            widget.coachDetail?[index].avatar
                                                    .toString() ??
                                                '',
                                          ))),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                SizedBox(
                                  height: 48,
                                  child: Center(
                                    child: Text(
                                      widget.coachDetail?[index].full_name ??
                                          '',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xfff1a202c),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 17),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset('assets/icons/eye.svg'),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        widget.coachDetail?[index]
                                                .total_video_view
                                                .toString() ??
                                            '',
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xfff2d3748)),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    )),
          ),
        )
      ],
    );
  }
}
