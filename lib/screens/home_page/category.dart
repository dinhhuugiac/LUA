import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class ModeCategoryPage {
  String listNameCategory;
  String imageCategory;

  ModeCategoryPage(this.listNameCategory, this.imageCategory);
}

class _CategoryState extends State<Category> {
  List<ModeCategoryPage> dateCategory = [
    ModeCategoryPage(
      'Fitness',
      'assets/images/category_1.png',
    ),
    ModeCategoryPage(
      'Mindfulness',
      'assets/images/category_2.png',
    ),
    ModeCategoryPage(
      'Yoga',
      'assets/images/category_3.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 18, left: 18),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                'Thể loại ',
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
          Container(
            child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(vertical: 1),
                itemCount: dateCategory.length,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => Container(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            height: 157,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                  dateCategory[index].imageCategory),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 157,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                          Positioned(
                              left: 12,
                              child: Text(dateCategory[index].listNameCategory,
                                  style: const TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white)))
                        ],
                      ),
                    )),
          )
        ],
      ),
    );
  }
}
