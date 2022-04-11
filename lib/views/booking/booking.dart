// import 'package:booking_room_app/views/available_room/available_room.dart';
import 'package:booking_room_app/views/available_room/available_room.dart';
import 'package:booking_room_app/views/booking/widgets/capacity_header.dart';
import 'package:booking_room_app/views/booking/widgets/carousel_location.dart';
import 'package:booking_room_app/views/booking/widgets/date_picker_header.dart';
import 'package:booking_room_app/views/booking/widgets/facility_header.dart';
import 'package:booking_room_app/views/booking/widgets/time_picker_header.dart';
import 'package:booking_room_app/views/booking/widgets/title_header.dart';
import 'package:booking_room_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class BookingView extends StatefulWidget {
  const BookingView({Key? key}) : super(key: key);

  @override
  State<BookingView> createState() => _BookingViewState();
}

class _BookingViewState extends State<BookingView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.grey.withOpacity(0.9),
        body: Stack(
          children: [
            const CustomScrollView(
              slivers: [
                SliverPersistentHeader(
                  delegate:
                      TitleHeader(maxExtentHeight: 150, minExtentHeight: 60),
                  pinned: true,
                  floating: false,
                ),
                SliverPersistentHeader(
                  delegate: LocationHeader(
                    maxExtentHeight: 160,
                    minExtentHeight: 160,
                  ),
                  pinned: false,
                  floating: false,
                ),
                SliverPersistentHeader(
                  delegate: DatePickerHeader(
                    maxExtentHeight: 160,
                    minExtentHeight: 160,
                  ),
                  pinned: false,
                  floating: false,
                ),
                SliverPersistentHeader(
                  delegate: TimePickerHeader(
                    maxExtentHeight: 160,
                    minExtentHeight: 160,
                  ),
                  pinned: false,
                  floating: false,
                ),
                SliverPersistentHeader(
                  delegate: CapacityHeader(
                      maxExtentHeight: 150, minExtentHeight: 150),
                  pinned: false,
                  floating: false,
                ),
                SliverPersistentHeader(
                  delegate: FacilityHeader(
                      maxExtentHeight: 241, minExtentHeight: 241),
                  pinned: false,
                  floating: false,
                ),
              ],
            ),
            Positioned(
              right: 0,
              left: 0,
              bottom: 20,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Material(
                  borderRadius: BorderRadius.circular(25),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AvailableRoomView(),
                          ));
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25))),
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(5.0)),
                      backgroundColor: MaterialStateProperty.all(
                          const Color(0xFF7f8C8D).withOpacity(0.5)),
                    ),
                    child: Center(
                      child: Text(
                        'Apply',
                        style: primaryTextStyle().copyWith(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CardContentSliver extends StatelessWidget {
  const CardContentSliver({required this.index, Key? key}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Text('test $index'),
    );
  }
}
