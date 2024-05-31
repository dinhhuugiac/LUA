// import 'package:flutter/material.dart';
// import 'package:lua_v3/conponents/colors.dart';

// class PageViews extends StatefulWidget {
//   const PageViews({super.key});

//   @override
//   State<PageViews> createState() => _PageViewsState();
// }

// class _PageViewsState extends State<PageViews> {
//   int _currentPage = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           decoration: const BoxDecoration(
//               borderRadius: BorderRadius.all(Radius.circular(16))),
//           height: 232,
//           width: 358,
//           child: PageView(
//             onPageChanged: (index) {
//               setState(() {
//                 _currentPage = index;
//               });
//             },
//             children: [
//               Container(
//                 decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(16)),
//                   image: DecorationImage(
//                     fit: BoxFit.cover,
//                     image: AssetImage(
//                       'assets/images/banner slide_home.png',
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(16)),
//                   image: DecorationImage(
//                     fit: BoxFit.cover,
//                     image: AssetImage(
//                       'assets/images/banner slide_home.png',
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(16)),
//                   image: DecorationImage(
//                     fit: BoxFit.cover,
//                     image: AssetImage(
//                       'assets/images/banner slide_home.png',
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(height: 8),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             for (int i = 0; i < 3; i++)
//               Container(
//                 width: 10,
//                 height: 10,
//                 margin: const EdgeInsets.symmetric(horizontal: 2),
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: i == _currentPage
//                       ? ColorsApp.backGroundColor
//                       : Colors.grey,
//                 ),
//               ),
//           ],
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:lua_v3/conponents/colors.dart';

class PageViews extends StatefulWidget {
  const PageViews({Key? key}) : super(key: key);

  @override
  _PageViewsState createState() => _PageViewsState();
}

class _PageViewsState extends State<PageViews> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18),
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              height: 232,
              aspectRatio: 16 / 9,
              viewportFraction: 1.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentPage = index;
                });
              },
            ),
            items: [
              'assets/images/banner slide_home.png',
              'assets/images/banner slide_home.png',
              'assets/images/category_1.png',
            ].map((String image) {
              return Container(
                margin: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 3; i++)
                Container(
                  width: 10,
                  height: 10,
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: i == _currentPage
                        ? ColorsApp.backGroundColor
                        : Colors.grey,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
