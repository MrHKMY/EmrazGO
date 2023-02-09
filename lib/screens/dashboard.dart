import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_1/widgets/card_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    List<int> list = [1, 2, 3, 4, 5];
    final List<String> imgList = [
      'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
      'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
      'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height -
                  kBottomNavigationBarHeight,
              left: 20,
              right: 20),
          color: Colors.grey[100],
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.blue,
                          radius: 30,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Name",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text("Location")
                          ],
                        ),
                        Spacer(),
                        Text("Today weather"),
                      ],
                    ),
                  ),
                ), //CircleAvatar
                SizedBox(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      fit: StackFit.expand,
                      children: [
                        CarouselSlider(
                          items: imgList
                              .map((item) => Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      // margin: EdgeInsets.all(5),
                                      // decoration: BoxDecoration(
                                      //     color: Colors.blue,
                                      //     borderRadius:
                                      //         BorderRadius.all(Radius.circular(10))),
                                      child: Image.network(item,
                                          fit: BoxFit.cover,
                                          width: double.infinity),
                                    ),
                                  ))
                              .toList(),
                          carouselController: _controller,
                          options: CarouselOptions(
                              padEnds: true,
                              aspectRatio: 1.6,
                              viewportFraction: 0.9,
                              autoPlay: true,
                              enlargeCenterPage: true,
                              enlargeFactor: 0.5,
                              enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _current = index;
                                });
                              }),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: imgList.map(
                                (image) {
                                  int index = imgList.indexOf(image);

                                  return Container(
                                    width: 8.0,
                                    height: 8.0,
                                    margin: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 2.0),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: _current == index
                                            ? Colors.white
                                            : Color.fromRGBO(0, 0, 0, 0.4)),
                                  );
                                },
                              ).toList()),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Recommendation",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                SizedBox(height: 9),
                Container(
                  height: 160,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      CardWidget(text: "Package 1"),
                      CardWidget(text: "Package 2"),
                      CardWidget(text: "Package 3"),
                      CardWidget(text: "Package 4"),
                      CardWidget(text: "Package 5")
                    ],
                  ),
                ),
                //   Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: imgList.asMap().entries.map((entry) {
                //     return GestureDetector(
                //       onTap: () => _controller.animateToPage(entry.key),
                //       child: Container(
                //         width: 12.0,
                //         height: 12.0,
                //         margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                //         decoration: BoxDecoration(
                //             shape: BoxShape.circle,
                //             color: (Theme.of(context).brightness == Brightness.dark
                //                     ? Colors.white
                //                     : Colors.black)
                //                 .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                //       ),
                //     );
                //   }).toList(),

                // ),
              ]),
        ),
      ),
    );
  }
}
