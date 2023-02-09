import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PackageDetailScreen extends StatefulWidget {
  const PackageDetailScreen({super.key});

  @override
  State<PackageDetailScreen> createState() => _PackageDetailScreenState();
}

class _PackageDetailScreenState extends State<PackageDetailScreen> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(children: [
        Container(
          height: 400,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            fit: StackFit.expand,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.blue,
                ),
                // child: CarouselSlider(
                //   items: imgList
                //       .map((item) => Padding(
                //             padding: const EdgeInsets.all(5.0),
                //             child: ClipRRect(
                //               //borderRadius: BorderRadius.circular(8.0),
                //               // margin: EdgeInsets.all(5),
                //               // decoration: BoxDecoration(
                //               //     color: Colors.blue,
                //               //     borderRadius:
                //               //         BorderRadius.all(Radius.circular(10))),
                //               child: Image.network(
                //                 item,
                //                 fit: BoxFit.cover,
                //                 width: double.infinity,
                //                 height: 150,
                //               ),
                //             ),
                //           ))
                //       .toList(),
                //   carouselController: _controller,
                //   options: CarouselOptions(
                //       aspectRatio: 1.6,
                //       viewportFraction: 1,
                //       autoPlay: false,
                //       enlargeCenterPage: true,
                //       enlargeFactor: 0.5,
                //       enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                //       onPageChanged: (index, reason) {
                //         setState(() {
                //           _current = index;
                //         });
                //       }),
                // ),
              ),
              Positioned(
                top: 180,
                left: 50,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  height: 120,
                  width: 300,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
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
        ElevatedButton(
          onPressed: () {},
          child: Text("Select Date"),
        )
      ]),
    );
  }
}
