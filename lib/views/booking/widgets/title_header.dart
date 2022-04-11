import 'dart:math';

import 'package:booking_room_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class TitleHeader extends SliverPersistentHeaderDelegate {
  final double maxExtentHeight;
  final double minExtentHeight;

  const TitleHeader(
      {required this.maxExtentHeight, required this.minExtentHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    double shrinkPercentage = min(1, shrinkOffset / (maxExtent - minExtent));
    return Material(
      elevation: 5,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Opacity(
              opacity: 1 - shrinkPercentage,
              child: Text(
                'Select date to order',
                style: primaryTextStyle().copyWith(
                  fontSize: 35,
                  color: const Color(0xFF7f8C8D).withOpacity(.5),
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Opacity(
              opacity: shrinkPercentage,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 15.0, bottom: 10.0, top: 10.0),
                child: Text(
                  'Schedule',
                  style: primaryTextStyle().copyWith(
                    fontSize: 30,
                    color: const Color(0xFF7f8C8D).withOpacity(.5),
                    fontWeight: FontWeight.w600,
                  ),
                ),
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
}
