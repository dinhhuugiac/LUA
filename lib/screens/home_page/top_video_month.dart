import 'package:flutter/material.dart';

class TopVideoMonth extends StatefulWidget {
  const TopVideoMonth({super.key});

  @override
  State<TopVideoMonth> createState() => _TopVideoMonthState();
}

class ModeVideoMOnthPage {
  String listVideo;
  String timeVideo;
  String listTitleVideo;

  String videoOwner;

  ModeVideoMOnthPage(
    this.listVideo,
    this.timeVideo,
    this.listTitleVideo,
    this.videoOwner,
  );
}

List<ModeVideoMOnthPage> dataVideoMonth = [
  ModeVideoMOnthPage('assets/images/video_1.png', '35:00',
      'Các bài tập Yoga cơ bản cho người mới bắt đầu', 'Dương Amy - Yoga'),
  ModeVideoMOnthPage('assets/images/video_2.png', '35:00',
      'Bài tập Yoga ngày thứ 7', 'Dương Amy - Yoga'),
  ModeVideoMOnthPage('assets/images/video_3.png', '35:00',
      'Các bài tập Yoga cơ bản cho người mới bắt đầu', 'Dương Amy - Yoga'),
  ModeVideoMOnthPage('assets/images/video_2.png', '35:00',
      'Bài tập Yoga ngày thứ 7', 'Dương Amy - Yoga'),
];

class _TopVideoMonthState extends State<TopVideoMonth> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 16, left: 16),
          child: Row(
            children: [
              const Text(
                'Top video tháng',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xfff0f172a),
                ),
              ),
              Expanded(child: Container()),
              const Text(
                'xem thêm ',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xfff4a5568),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 180,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: dataVideoMonth.length,
              itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(
                        right: 16, top: 8, bottom: 16, left: 16),
                    child: SizedBox(
                      height: 148,
                      width: 179,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(children: [
                            Container(
                              height: 104,
                              width: 178,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(16)),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          dataVideoMonth[index].listVideo))),
                            ),
                            Positioned(
                              right: 9,
                              bottom: 7,
                              child: Container(
                                width: 45,
                                height: 28,
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.5),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8))),
                                child: Center(
                                  child: Text(
                                    dataVideoMonth[index].timeVideo,
                                    style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          ]),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            dataVideoMonth[index].listTitleVideo,
                            maxLines: 2,
                            style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Color(0xffff1a202c)),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            dataVideoMonth[index].videoOwner,
                            style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Color(0xffff2d3748)),
                          ),
                        ],
                      ),
                    ),
                  )),
        )
      ],
    );
  }
}
