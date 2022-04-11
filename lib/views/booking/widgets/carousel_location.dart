import 'package:booking_room_app/views/booking/widgets/label_header.dart';
import 'package:booking_room_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

final List<LocationModel> locations = [
  LocationModel(false, 'All'),
  LocationModel(false, 'SML 10th Floor'),
];

class LocationHeader extends SliverPersistentHeaderDelegate {
  const LocationHeader(
      {required this.maxExtentHeight, required this.minExtentHeight});

  final double maxExtentHeight;
  final double minExtentHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15.0, 30.0, 0.0, 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          LabelHeader(name: 'Location'),
          SizedBox(
            height: 60,
            child: CarouselLocation(),
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

class CarouselLocation extends StatefulWidget {
  const CarouselLocation({Key? key}) : super(key: key);

  @override
  State<CarouselLocation> createState() => _CarouselLocationState();
}

class _CarouselLocationState extends State<CarouselLocation> {
  int currentSegment = 0;
  int groupValue = 0;

  void onValueChanged(int index) {
    currentSegment = index;

    setState(() {
      for (var element in locations) {
        element.isSelected = false;
      }
      locations[index].isSelected = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: [
        ...locations.asMap().entries.map<Widget>((val) {
          return GestureDetector(
            onTap: () => onValueChanged(val.key),
            // child:

            // child: AnimatedContainer(
            //   duration: const Duration(milliseconds: 300),
            //   margin: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 0.0),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(20),
            //     boxShadow: [
            //       BoxShadow(
            //         color: Colors.black.withOpacity(0.1),
            //         offset: const Offset(0.0, 0.0),
            //         blurRadius: 5.0,
            //         spreadRadius: 1,
            //       ),
            //     ],
            //   ),
            //   child: ClipRRect(
            //     borderRadius: BorderRadius.circular(20),
            //     child: Container(
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(20),
            //         // color: const Color(0xFFEFEEEE),
            //         boxShadow: [
            //           BoxShadow(
            //               color: Colors.white.withOpacity(0.9),
            //               offset: const Offset(6.0, 6.0),
            //               blurRadius: 6.0,
            //               spreadRadius: 8),
            //           BoxShadow(
            //               color: Colors.black.withOpacity(0.1),
            //               offset: const Offset(-6.0, -6.0),
            //               blurRadius: 6.0,
            //               spreadRadius: 8),
            //         ],
            //       ),
            //       margin: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
            //       padding: const EdgeInsets.all(2.0),
            //       child: Center(
            //         child: Text(
            //           val.value.locationName,
            //           style: primaryTextStyle().copyWith(
            //             fontSize: 15,
            //             color: Colors.black54,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // )
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              padding: const EdgeInsets.fromLTRB(23, 5, 23, 5),
              margin: const EdgeInsets.only(top: 15.0, right: 8.0),
              decoration: BoxDecoration(
                color: val.value.isSelected ? const Color(0xFFBDC3C7) : null,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: val.value.isSelected
                      ? Colors.transparent
                      : Colors.black54, //const Color(0xFFBDC3C7),
                  // color: const Color(0xFF3498DB),
                ),
              ),
              child: Center(
                child: Text(
                  val.value.locationName,
                  style: primaryTextStyle().copyWith(
                    fontSize: 18,
                    color: val.value.isSelected ? Colors.white : Colors.black54,
                  ),
                ),
              ),
            ),
          );
        }).toList()
      ],
    );
  }
}

class LocationModel {
  bool isSelected;
  final String locationName;
  LocationModel(this.isSelected, this.locationName);
}
