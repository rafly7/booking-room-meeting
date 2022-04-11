import 'dart:math';

import 'package:booking_room_app/views/booking/widgets/button_time_picker.dart';
import 'package:booking_room_app/views/booking/widgets/label_header.dart';
import 'package:booking_room_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TimePickerHeader extends SliverPersistentHeaderDelegate {
  const TimePickerHeader(
      {required this.maxExtentHeight, required this.minExtentHeight});

  final double maxExtentHeight;
  final double minExtentHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    double shrinkPercentage = min(1, shrinkOffset / (maxExtent - minExtent));

    return Container(
      padding: const EdgeInsets.fromLTRB(15.0, 0, 0.0, 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LabelHeader(
            name: 'Time',
          ),
          ButtonTimePicker()
        ],
      ),
    );
  }

  Widget textLocation(String text) => Container(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        margin: const EdgeInsets.only(top: 15.0, right: 8.0),
        decoration: BoxDecoration(
          color: const Color(0xFF3498DB),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            text,
            style: primaryTextStyle().copyWith(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      );

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
