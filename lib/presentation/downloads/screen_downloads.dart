import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({Key? key}) : super(key: key);

  final List imageList = [
    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/gDoareEtuBpFd3Do50NXNP2dJbQ.jpg",
    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/9v2NSI8MJ7Qb1U0CaWS0DCBAFGQ.jpg",
    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/7Lphv628sutTUvviz0UVlHDMd4.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
            title: "Downloads",
          )),
      body: ListView(
        children: [
          Row(
            children: const [
              kWidth,
              Icon(
                Icons.settings,
                color: kWhiteColor,
              ),
              kWidth,
              Text("Smart Downloads")
            ],
          ),
          Text("Introducing Downloads for you"),
          Text(
              "We'll download a personalied selection of movies and shows for you, so there's always something to watch on your device."),
          Container(
            width: size.width,
            height: size.width,
            color: Colors.white,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: size.width * 0.37,
                ),
                DownloadsImageWidget(
                    imageList: imageList[0], margin: EdgeInsets.only(left: 130, bottom: 50),angle: 20,
                    ),
                 DownloadsImageWidget(
                    imageList: imageList[1], margin: EdgeInsets.only(right:130, bottom: 50),angle: -20,
                    ),
                   DownloadsImageWidget(
                    imageList: imageList[2], margin: EdgeInsets.only(top: 0)
                    ),
              ],
            ),
          ),
          MaterialButton(
            color: kButtonColorBlue,
            onPressed: () {},
            child: Text(
              "Set up",
              style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          MaterialButton(
            color: kButtonColorWhite,
            onPressed: () {},
            child: Text(
              "See what you can download",
              style: TextStyle(
                  color: kBlackColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget(
      {Key? key, required this.imageList, this.angle = 0, required this.margin})
      : super(key: key);

  final String imageList;
  final double angle;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        width: size.width * 0.4,
        height: size.width * 0.58,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage(imageList),
          ),
        ),
      ),
    );
  }
}
