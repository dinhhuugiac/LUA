import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lua_v3/conponents/colors.dart';

class SeeMorePage extends StatefulWidget {
  const SeeMorePage({Key? key}) : super(key: key);

  @override
  State<SeeMorePage> createState() => _SeeMorePageState();
}

class ModeFamousCoachPage {
  String listNameCoach;
  String listImageCoach;

  ModeFamousCoachPage(this.listNameCoach, this.listImageCoach);
}

List<ModeFamousCoachPage> dataFamousCoach = [
  ModeFamousCoachPage('Đặng Hoàng Minh Tâm', 'assets/images/coach.png'),
  ModeFamousCoachPage('Đặng Hoàng Minh Tâm', 'assets/images/coach.png'),
  ModeFamousCoachPage('Đặng Hoàng Minh Tâm', 'assets/images/coach.png'),
  ModeFamousCoachPage('Đặng Hoàng Minh Tâm', 'assets/images/coach.png'),
  ModeFamousCoachPage('Đặng Hoàng Minh Tâm', 'assets/images/coach.png'),
  ModeFamousCoachPage('Đặng Hoàng Minh Tâm', 'assets/images/coach.png'),
];

class _SeeMorePageState extends State<SeeMorePage> {
  bool arrangeSelected = false;
  String selectedArrange = ' ';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Huấn luyện viên ',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  border: Border.all(
                    color: const Color(0xfffcbd5e0),
                  ),
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 11,
                    ),
                    SvgPicture.asset('assets/icons/ahahahaahah.svg'),
                    const SizedBox(
                      width: 8,
                    ),
                    const Expanded(
                      child: TextField(
                        cursorColor: ColorsApp.backGroundColor,
                        decoration: InputDecoration(
                          hintText: 'Huấn luyện viên ',
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xfffa0aec0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Row(children: [
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return StatefulBuilder(
                          builder:
                              (BuildContext context, StateSetter setState) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 16, right: 16, top: 16, bottom: 35),
                              child: SizedBox(
                                height: 328,
                                child: Column(
                                  children: [
                                    const Center(
                                      child: Text(
                                        'Sắp xếp',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectedArrange = 'vietnamese';
                                          arrangeSelected = true;
                                        });
                                      },
                                      child: SizedBox(
                                        height: 56,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              child: const Row(
                                                children: [
                                                  Text(
                                                    'Phổ biến',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color(0xfff2d3748),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Radio(
                                              activeColor:
                                                  const Color(0xfff67a800),
                                              value: 'phổ biến',
                                              groupValue: selectedArrange,
                                              onChanged: (value) {
                                                setState(() {
                                                  selectedArrange =
                                                      value.toString();
                                                  arrangeSelected = true;
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 56,
                                      width: 382,
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            selectedArrange = 'mới nhất';
                                            arrangeSelected = true;
                                          });
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const SizedBox(
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'Mới nhất',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Color(0xfff2d3748),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Radio(
                                              activeColor:
                                                  const Color(0xfff67a800),
                                              value: 'mới nhất',
                                              groupValue: selectedArrange,
                                              onChanged: (value) {
                                                setState(() {
                                                  selectedArrange =
                                                      value.toString();
                                                  arrangeSelected = true;
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 89,
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        if (arrangeSelected) {
                                          Navigator.pop(context);
                                        }
                                      },
                                      style: TextButton.styleFrom(
                                        minimumSize: const Size(390, 56),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        backgroundColor:
                                            ColorsApp.backGroundColor,
                                      ),
                                      child: const Text(
                                        'Xác nhận',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFFFFFFFF),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                  child: Container(
                    height: 32,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      border: Border.all(
                        color: ColorsApp.backGroundColor,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/icons/a-z.svg'),
                          const SizedBox(
                            width: 8,
                          ),
                          const Text(
                            'Mới nhất',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: ColorsApp.backGroundColor),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          SvgPicture.asset('assets/icons/down.svg')
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(child: Container()),
                SvgPicture.asset('assets/icons/button.svg')
              ]),
              const SizedBox(
                height: 32,
              ),
              Expanded(
                child: SizedBox(
                  height: 228,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.63,
                      crossAxisSpacing: 32,
                      mainAxisSpacing: 32,
                    ),
                    itemCount: dataFamousCoach.length,
                    itemBuilder: (context, index) => Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 157,
                            width: 157,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage('assets/images/coach.png'),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            height: 48,
                            child: SizedBox(
                              width: 157,
                              child: Center(
                                child: Text(
                                  dataFamousCoach[index].listNameCoach,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xfff1a202c),
                                  ),
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
                                const Text(
                                  '1.000.lượt xem',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xfff2d3748),
                                  ),
                                ),
                              ],
                            ),
                          ),
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
    );
  }
}
