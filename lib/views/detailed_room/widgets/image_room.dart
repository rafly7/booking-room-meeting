import 'dart:math';
import 'dart:ui';

import 'package:booking_room_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ImageRoom extends SliverPersistentHeaderDelegate {
  final double maxExtentHeight;
  final double minExtentHeight;
  final String pathImage;
  final String title;
  final String subTitle;
  final int id;

  const ImageRoom({
    required this.id,
    required this.pathImage,
    required this.title,
    required this.subTitle,
    required this.maxExtentHeight,
    required this.minExtentHeight,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    double shrinkPercentage = min(1, shrinkOffset / (maxExtent - minExtent));
    return Material(
      color: const Color(0xFFEFEEEE),
      elevation: 5.0,
      child: Stack(
        children: [
          Hero(
            tag: id,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: 1 - shrinkPercentage,
              curve: Curves.easeInOut,
              child: Image.asset(
                pathImage,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              decoration: BoxDecoration(
                gradient: shrinkPercentage == 0
                    ? const LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      )
                    : null,
              ),
              padding: const EdgeInsets.fromLTRB(15.0, 8.0, 0.0, 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textAnimationColor(
                      shrinkPercentage, title, 25, FontWeight.w600),
                  // Stack(
                  //   children: [
                  //     Text(
                  //       title,
                  //       style: primaryTextStyle().copyWith(
                  //         fontSize: 25,
                  //         color: Colors.white.withOpacity(1 - shrinkPercentage),
                  //         fontWeight: FontWeight.w600,
                  //       ),
                  //     ),
                  //     Text(
                  //       title,
                  //       style: primaryTextStyle().copyWith(
                  //         fontSize: 25,
                  //         color: Colors.black.withOpacity(shrinkPercentage),
                  //         fontWeight: FontWeight.w600,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: textAnimationColor(
                          shrinkPercentage, subTitle, 17, null)
                      // child: Text(
                      //   subTitle,
                      //   style: primaryTextStyle().copyWith(
                      //     fontSize: 17,
                      //     color: Colors.white,
                      //   ),
                      // ),
                      )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => maxExtentHeight;

  @override
  // TODO: implement minExtent
  double get minExtent => minExtentHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;

  Widget textAnimationColor(double shrinkPercentage, String text,
          double fontSize, FontWeight? fontWeight) =>
      Stack(
        children: [
          Text(
            text,
            style: primaryTextStyle().copyWith(
              fontSize: fontSize,
              color: Colors.white.withOpacity(1 - shrinkPercentage),
              fontWeight: fontWeight,
            ),
          ),
          Text(
            text,
            style: primaryTextStyle().copyWith(
              fontSize: fontSize,
              color: Colors.black54.withOpacity(shrinkPercentage),
              fontWeight: fontWeight,
            ),
          ),
        ],
      );
}
