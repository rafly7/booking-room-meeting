import 'dart:math';

import 'package:booking_room_app/views/booking/widgets/button_date_picker.dart';
import 'package:booking_room_app/views/booking/widgets/label_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DatePickerHeader extends SliverPersistentHeaderDelegate {
  const DatePickerHeader(
      {required this.maxExtentHeight, required this.minExtentHeight});

  final double maxExtentHeight;
  final double minExtentHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    double shrinkPercentage = min(1, shrinkOffset / (maxExtent - minExtent));

    return Container(
      padding: const EdgeInsets.fromLTRB(15.0, 10, 0.0, 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LabelHeader(
            name: 'Date',
          ),
          ButtonDatePicker()
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
