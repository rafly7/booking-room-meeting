import 'package:booking_room_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import 'label_header.dart';

class FacilityHeader extends SliverPersistentHeaderDelegate {
  const FacilityHeader(
      {required this.maxExtentHeight, required this.minExtentHeight, Key? key});
  final double maxExtentHeight;
  final double minExtentHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15.0, 0, 0.0, 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LabelHeader(name: 'Facility'),
          CarouselFacility(),
        ],
      ),
    );
  }

  @override
  double get maxExtent => maxExtentHeight;

  @override
  // TODO: implement minExtent
  double get minExtent => minExtentHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}

class CarouselFacility extends StatefulWidget {
  const CarouselFacility({Key? key}) : super(key: key);

  @override
  State<CarouselFacility> createState() => _CarouselFacilityState();
}

class _CarouselFacilityState extends State<CarouselFacility> {
  final List<FacilityModel> facilitys = [
    FacilityModel(false, 'Projector', Icons.camera_indoor_outlined),
    FacilityModel(false, 'Phone', Icons.phone_android_outlined),
    FacilityModel(false, 'Wireless Presentation', Icons.wifi_rounded),
    FacilityModel(false, 'Vicon', Icons.videocam_outlined),
    FacilityModel(false, 'LED TV', Icons.tv_rounded),
    FacilityModel(false, 'HDMI', Icons.cable_outlined)
  ];

  @override
  void initState() {
    super.initState();
  }

  int currentSegment = 0;
  void onValueChanged(int index) {
    currentSegment = index;
    setState(() {
      if (facilitys[index].isSelected) {
        facilitys[index].isSelected = false;
      } else {
        facilitys[index].isSelected = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15.0),
      height: 90,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          ...facilitys.asMap().entries.map<Widget>((val) {
            return GestureDetector(
              onTap: () => onValueChanged(val.key),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                margin: const EdgeInsets.only(right: 15.0),
                padding: const EdgeInsets.fromLTRB(20, 8.0, 20.0, 8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: val.value.isSelected
                      ? const Color(0xFF7f8C8D).withOpacity(.6)
                      : null,
                  border: Border.all(
                    color: val.value.isSelected
                        ? Colors.transparent
                        : const Color(0xFF7f8C8D),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Text(
                        val.value.buttonText,
                        style: primaryTextStyle().copyWith(
                          fontSize: 18,
                          color: val.value.isSelected
                              ? Colors.white
                              : const Color(0xFF7f8C8D).withOpacity(.9),
                        ),
                      ),
                    ),
                    Icon(
                      val.value.icon,
                      color: val.value.isSelected
                          ? Colors.white
                          : const Color(0xFF7f8C8D),
                      size: 25,
                    ),
                  ],
                ),
              ),
            );
          }).toList()
        ],
      ),
    );
  }
}

class FacilityModel {
  bool isSelected;
  final String buttonText;
  final IconData icon;
  FacilityModel(this.isSelected, this.buttonText, this.icon);
}
