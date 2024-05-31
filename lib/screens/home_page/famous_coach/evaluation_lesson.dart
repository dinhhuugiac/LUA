import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lua_v3/conponents/colors.dart';

class EvaluationLessonPage extends StatefulWidget {
  const EvaluationLessonPage({Key? key}) : super(key: key);

  @override
  State<EvaluationLessonPage> createState() => _EvaluationCoachPageState();
}

class ModeEvaluationLesson {
  String avatar;
  String nameCoach;
  String numberstar;
  String titileEvaluationLesson;

  ModeEvaluationLesson(this.avatar, this.nameCoach, this.numberstar,
      this.titileEvaluationLesson);
}

List<ModeEvaluationLesson> dataEvaluationLesson = [
  ModeEvaluationLesson('assets/images/avatar_1.png', 'Khánh Hoàn', '5',
      'I had the pleasure of ordering a custom cake from this bakery for a special occasion, and it exceeded my expectations. The design was stunning, and it tasted even better.'),
  ModeEvaluationLesson('assets/images/video_1.png', 'Key Trúc Xinh', '5',
      'This bakery offers a great variety of gluten-free options, which is a lifesaver for someone with dietary restrictions like me. The taste is never compromised!'),
  ModeEvaluationLesson('assets/images/video_2.png', 'Mel Tran', '5',
      'I absolutely adore this bakery! Their freshly baked bread is heavenly, and their pastries are a delight to the taste buds.'),
  ModeEvaluationLesson('assets/images/video_3.png', 'Nguyễn Lê Hải Phong', '4',
      'I had the pleasure of ordering a custom cake from this bakery for a special occasion, and it exceeded my expectations. The design was stunning, and it tasted even better.'),
  ModeEvaluationLesson('assets/images/video_1.png', 'Key Trúc Xinh', '5',
      'I had the pleasure of ordering a custom cake from this bakery for a special occasion, and it exceeded my expectations. The design was stunning, and it tasted even better.'),
  ModeEvaluationLesson('assets/images/video_1.png', 'Key Trúc Xinh', '5',
      'The staff at this bakery is incredibly friendly and welcoming. They always take the time to assist customers and make recommendations.'),
  ModeEvaluationLesson('assets/images/video_1.png', 'Key Trúc Xinh', '5',
      'The staff at this bakery is incredibly friendly and welcoming. They always take the time to assist customers and make recommendations.'),
  ModeEvaluationLesson('assets/images/video_1.png', 'Key Trúc Xinh', '5',
      'The croissants here are simply perfection! Golden and flaky on the outside, light and buttery on the inside. I get enough of them.'),
  ModeEvaluationLesson('assets/images/video_1.png', 'Key Trúc Xinh', '5',
      'I had the pleasure of ordering a custom cake from this bakery for a special occasion, and it exceeded my expectations. The design was stunning, and it tasted even better.'),
  ModeEvaluationLesson('assets/images/video_1.png', 'Key Trúc Xinh', '4',
      'The staff at this bakery is incredibly friendly and welcoming. They always take the time to assist customers and make recommendations.'),
  ModeEvaluationLesson('assets/images/video_1.png', 'Key Trúc Xinh', '1',
      'The croissants here are simply perfection! Golden and flaky on the outside, light and buttery on the inside. I can\'t get enough of them.'),
  ModeEvaluationLesson('assets/images/avatar_1.png', 'Khánh Hoàn', '5',
      'I had the pleasure of ordering a custom cake from this bakery for a special occasion, and it exceeded my expectations. The design was stunning, and it tasted even better.'),
  ModeEvaluationLesson('assets/images/avatar_1.png', 'Khánh Hoàn', '3',
      'I had the pleasure of ordering a custom cake from this bakery for a special occasion, and it exceeded my expectations. The design was stunning, and it tasted even better.'),
];

class _EvaluationCoachPageState extends State<EvaluationLessonPage> {
  int _selectedIndex = -1;
  double _selectedRating = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
    _selectedRating = 0;

    double averageRating = _calculateAverageRating();
    print('Tổng trung bình số sao: $averageRating');
  }

  double _roundAverageRating(double rating) {
    double roundedRating = rating.floorToDouble();
    double decimalPart = rating - roundedRating;
    if (decimalPart >= 0.5 && decimalPart < 1.0) {
      return roundedRating + 0.5;
    } else {
      return roundedRating;
    }
  }

  double _calculateAverageRating() {
    double totalRating = 0;
    for (var item in dataEvaluationLesson) {
      totalRating += double.parse(item.numberstar);
    }
    return totalRating / dataEvaluationLesson.length;
  }

  List<bool> itemStates = List.generate(6, (index) => true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
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
                        'Đánh giá bài học',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 77,
                  child: Row(
                    children: [
                      // Sao đánh giá
                      SizedBox(
                        height: 77,
                        child: Row(
                          children: [
                            // Sao đánh giá
                            SizedBox(
                              child: Column(
                                children: [
                                  Text(
                                    _calculateAverageRating()
                                        .toStringAsFixed(1),
                                    style: const TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xffff212b36),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 12,
                                    child: RatingBar.builder(
                                      itemSize: 15,
                                      initialRating: _roundAverageRating(
                                          _calculateAverageRating()),
                                      minRating: 0,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      ignoreGestures: true,
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 16),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(0),
                          child: GridView.count(
                            padding: EdgeInsets.zero,
                            crossAxisCount: 3,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            childAspectRatio: 2.65,
                            children: List.generate(6, (index) {
                              return _buildRatingItem(
                                label: _getRatingLabel(index),
                                index: index,
                              );
                            }),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(0),
                    itemCount: dataEvaluationLesson.length,
                    itemBuilder: (context, index) {
                      return _renderEvaluationItem(dataEvaluationLesson[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderEvaluationItem(ModeEvaluationLesson evaluation) {
    if (_selectedRating != 0 &&
        double.parse(evaluation.numberstar) != _selectedRating) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      evaluation.avatar,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          evaluation.nameCoach,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffff212b36),
                          ),
                        ),
                        const Text(
                          '10-04-2023 13:45',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffff919eab),
                          ),
                        ),
                      ],
                    ),
                    RatingBar.builder(
                      itemSize: 13,
                      initialRating: double.parse(evaluation.numberstar),
                      minRating: 0,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 5,
                      //chặn người dùng
                      ignoreGestures: true,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    const SizedBox(width: 8),
                    const SizedBox(width: 16),
                    Text(
                      evaluation.titileEvaluationLesson,
                      maxLines: 4,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffff919eab),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }

  Widget _buildRatingItem({required String label, required int index}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
          _selectedRating = _getRatingByIndex(index);
        });
        for (int i = 0; i < itemStates.length; i++) {
          itemStates[i] = (i == index);
        }
      },
      child: SizedBox(
        height: 28,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: _selectedIndex == index
                  ? Colors.grey
                  : ColorsApp.backGroundColor,
            ),
            color: _selectedIndex == index
                ? ColorsApp.backGroundColor
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: _selectedIndex == index
                    ? Colors.white
                    : const Color(0xffff637381),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  String _getRatingLabel(int index) {
    switch (index) {
      case 0:
        return 'Tất cả (${_getTotalComments()})';
      case 1:
        return '5 Sao (${_getCommentCountByRating(5)})';
      case 2:
        return '4 Sao (${_getCommentCountByRating(4)})';
      case 3:
        return '3 Sao (${_getCommentCountByRating(3)})';
      case 4:
        return '2 Sao (${_getCommentCountByRating(2)})';
      case 5:
        return '1 Sao (${_getCommentCountByRating(1)})';
      default:
        return '';
    }
  }

  double _getRatingByIndex(int index) {
    switch (index) {
      case 0:
        return 0;
      case 1:
        return 5;
      case 2:
        return 4;
      case 3:
        return 3;
      case 4:
        return 2;
      case 5:
        return 1;
      default:
        return 0;
    }
  }

  int _getTotalComments() {
    return dataEvaluationLesson.length;
  }

  int _getCommentCountByRating(double rating) {
    return dataEvaluationLesson
        .where((item) => double.parse(item.numberstar) == rating)
        .toList()
        .length;
  }
}
