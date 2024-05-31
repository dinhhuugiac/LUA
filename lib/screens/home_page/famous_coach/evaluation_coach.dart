import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lua_v3/conponents/colors.dart';

class EvaluationCoachPage extends StatefulWidget {
  const EvaluationCoachPage({Key? key}) : super(key: key);

  @override
  State<EvaluationCoachPage> createState() => _EvaluationCoachPageState();
}

class ModeEvaluationCoach {
  String avatar;
  String nameCoach;
  String numberstar;
  String titileEvaluationCoach;
  String listImageLesson;
  String titileEvaluationLesson;

  ModeEvaluationCoach(
      this.avatar,
      this.nameCoach,
      this.numberstar,
      this.titileEvaluationCoach,
      this.listImageLesson,
      this.titileEvaluationLesson);
}

List<ModeEvaluationCoach> dataEvaluationCoach = [
  ModeEvaluationCoach(
      'assets/images/avatar_1.png',
      'Khánh Hoàn',
      '1',
      'Giáo viên nhiệt tình, hướng dẫn rất hay và có trách nhiệm, nên học nha mọi người',
      'assets/images/danhgia_1.png',
      'Khóa học ngày 1 của huấn luyện viên Dương Army'),
  ModeEvaluationCoach(
      'assets/images/video_1.png',
      'Key Trúc Xinh',
      '2',
      'Giáo viên nhiệt tình, hướng dẫn rất hay và có trách nhiệm, nên học nha mọi người',
      'assets/images/video_2.png',
      'Khóa học ngày 1 của huấn luyện viên Dương Army'),
  ModeEvaluationCoach(
      'assets/images/video_2.png',
      'Mel Tran',
      '3',
      'Giáo viên nhiệt tình, hướng dẫn rất hay và có trách nhiệm, nên học nha mọi người',
      'assets/images/danhgia_1.png',
      'Khóa học ngày 1 của huấn luyện viên Dương Army'),
  ModeEvaluationCoach(
      'assets/images/video_3.png',
      'Nguyễn Lê Hải Phong',
      '4',
      'Giáo viên nhiệt tình, hướng dẫn rất hay và có trách nhiệm, nên học nha mọi người',
      'assets/images/danhgia_1.png',
      'Khóa học ngày 1 của huấn luyện viên Dương Army'),
  ModeEvaluationCoach(
      'assets/images/video_1.png',
      'Key Trúc Xinh',
      '5',
      'Giáo viên nhiệt tình, hướng dẫn rất hay và có trách nhiệm, nên học nha mọi người',
      'assets/images/danhgia_1.png',
      'Khóa học ngày 1 của huấn luyện viên Dương Army'),
  ModeEvaluationCoach(
      'assets/images/video_1.png',
      'Key Trúc Xinh',
      '2',
      'Giáo viên nhiệt tình, hướng dẫn rất hay và có trách nhiệm, nên học nha mọi người',
      'assets/images/danhgia_1.png',
      'Khóa học ngày 1 của huấn luyện viên Dương Army'),
  ModeEvaluationCoach(
      'assets/images/video_1.png',
      'Key Trúc Xinh',
      '3',
      'Giáo viên nhiệt tình, hướng dẫn rất hay và có trách nhiệm, nên học nha mọi người',
      'assets/images/danhgia_1.png',
      'Khóa học ngày 1 của huấn luyện viên Dương Army'),
  ModeEvaluationCoach(
      'assets/images/video_1.png',
      'Key Trúc Xinh',
      '2',
      'Giáo viên nhiệt tình, hướng dẫn rất hay và có trách nhiệm, nên học nha mọi người',
      'assets/images/danhgia_1.png',
      'Khóa học ngày 1 của huấn luyện viên Dương Army'),
  ModeEvaluationCoach(
      'assets/images/video_1.png',
      'Key Trúc Xinh',
      '5',
      'Giáo viên nhiệt tình, hướng dẫn rất hay và có trách nhiệm, nên học nha mọi người',
      'assets/images/video_3.png',
      'Khóa học ngày 1 của huấn luyện viên Dương Army'),
  ModeEvaluationCoach(
      'assets/images/video_1.png',
      'Key Trúc Xinh',
      '4',
      'Giáo viên nhiệt tình, hướng dẫn rất hay và có trách nhiệm, nên học nha mọi người',
      'assets/images/danhgia_1.png',
      'Khóa học ngày 1 của huấn luyện viên Dương Army'),
  ModeEvaluationCoach(
      'assets/images/video_1.png',
      'Key Trúc Xinh',
      '1',
      'Giáo viên nhiệt tình, hướng dẫn rất hay và có trách nhiệm, nên học nha mọi người',
      'assets/images/danhgia_1.png',
      'Khóa học ngày 1 của huấn luyện viên Dương Army'),
];

class _EvaluationCoachPageState extends State<EvaluationCoachPage> {
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
    double roundedRating = rating.floorToDouble(); // lấy ra phần nguyên
    double decimalPart = rating - roundedRating; // lấy rating - đi phần nguyên => lấy phần thập phân
    if (decimalPart >= 0.5 && decimalPart < 1.0) {
      return roundedRating + 0.5;
    } else {
      return roundedRating;
    }
  }

  double _calculateAverageRating() {
    double totalRating = 0;
    for (var item in dataEvaluationCoach) {
      totalRating += double.parse(item.numberstar);
    }
    return totalRating / dataEvaluationCoach.length;
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
                        'Đánh giá HLV',
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
                        child: Column(
                          children: [
                            Text(
                              _calculateAverageRating().toStringAsFixed(1),
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
                    itemCount: dataEvaluationCoach.length,
                    itemBuilder: (context, index) {
                      return _renderEvaluationItem(dataEvaluationCoach[index]);
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

  Widget _renderEvaluationItem(ModeEvaluationCoach evaluation) {
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
                    Text(
                      evaluation.titileEvaluationCoach,
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffff919eab),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            width: 342,
                            child: Row(
                              children: [
                                Container(
                                  width: 102,
                                  height: 51,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        evaluation.listImageLesson,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Flexible(
                                  child: Text(
                                    evaluation.titileEvaluationLesson,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xffff919eab),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
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
                  ? ColorsApp.backGroundColor
                  : Colors.grey,
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
    return dataEvaluationCoach.length;
  }

  int _getCommentCountByRating(double rating) {
    return dataEvaluationCoach
        .where((item) => double.parse(item.numberstar) == rating)
        .toList()
        .length;
  }
}
