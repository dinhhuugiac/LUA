import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProposePage extends StatefulWidget {
  const ProposePage({Key? key}) : super(key: key);

  @override
  State<ProposePage> createState() => _ProposePageState();
}

class ModeProposePage {
  String listVideo;
  String moreVideo;
  String tutalVideo;
  String timeVideo;

  ModeProposePage(
    this.listVideo,
    this.moreVideo,
    this.tutalVideo,
    this.timeVideo,
  );
}

List<ModeProposePage> dataPropose = [
  ModeProposePage(
    'assets/images/video_4.png',
    'assets/icons/morevideo.svg',
    '7',
    '',
  ),
  ModeProposePage(
    'assets/images/video_3.png',
    '',
    '',
    '35:00',
  ),
  ModeProposePage(
    'assets/images/video_2.png',
    '',
    '',
    '35:00',
  ),
];

class _ProposePageState extends State<ProposePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 16, left: 16),
          child: Row(
            children: [
              const Text(
                'Đề xuất cho bạn',
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
          height: 238,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: dataPropose.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                    right: 16, top: 8, left: 16, bottom: 16),
                child: SizedBox(
                  height: 148,
                  width: 179,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 104,
                            width: 178,
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16)),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(dataPropose[index].listVideo),
                              ),
                            ),
                          ),
                          if (index != 0)
                            Positioned(
                              right: 9,
                              bottom: 7,
                              child: Container(
                                width: 45,
                                height: 28,
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.5),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8)),
                                ),
                                child: Center(
                                  child: Text(
                                    dataPropose[index].timeVideo,
                                    style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          if (index == 0)
                            Container(
                              height: 104,
                              width: 178,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(16)),
                                  color: Colors.black.withOpacity(0.5)),
                            ),
                          Positioned(
                            top: 40,
                            right: 68,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  dataPropose[index].moreVideo,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Center(
                                  child: Text(
                                    dataPropose[index].tutalVideo,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        'Làm sao để bắt đầu tập Yoga cho người mới năm 2024 năm nhiều sức khỏe',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffff1a202c),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        'Dương Amy - Yoga',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffff2d3748),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
