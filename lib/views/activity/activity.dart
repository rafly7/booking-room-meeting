import 'package:booking_room_app/models/hive_adapter/booking_room.dart';
import 'package:booking_room_app/utils/enums.dart';
import 'package:booking_room_app/views/activity/widget/shadow_fab.dart';
import 'package:booking_room_app/views/booking/booking.dart';
import 'package:booking_room_app/views/detail_activity/detail_activity.dart';
import 'package:booking_room_app/widgets/container_shadow.dart';
import 'package:booking_room_app/widgets/custom_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ActivityView extends StatefulWidget {
  const ActivityView(
      {required this.title,
      required this.subTitle,
      required this.valueListenable,
      this.isShowFAB = false,
      Key? key})
      : super(key: key);

  final ValueListenable<Box<BookingRoom>> valueListenable;
  final bool isShowFAB;
  final String title;
  final String subTitle;

  @override
  State<ActivityView> createState() => _ActivityViewState();
}

class _ActivityViewState extends State<ActivityView> {
  final ValueNotifier<bool> onTapFAB = ValueNotifier<bool>(false);

  IconData getIcon(String data) {
    switch (data) {
      case 'Vicon':
        return Icons.videocam_outlined;
      case 'HDMI':
        return Icons.cable_outlined;
      case 'LED TV':
        return Icons.tv_rounded;
      case 'Wireless Presentation':
        return Icons.wifi_rounded;
      case 'Projector':
        return Icons.camera_indoor_outlined;
      case 'Phone':
        return Icons.phone_android_outlined;
      default:
        return Icons.ac_unit;
    }
  }

  String getStatus(StatusBookingRoom data) {
    switch (data) {
      case StatusBookingRoom.Booked:
        return 'Booked';
      case StatusBookingRoom.Started:
        return 'Started';
      case StatusBookingRoom.Ended:
        return 'Ended';
      case StatusBookingRoom.Cancelled:
        return 'Cancelled';
      default:
        throw UnimplementedError(
            'This value status string nothing in enum extension');
    }
  }

  Color status(StatusBookingRoom data) {
    switch (data) {
      case StatusBookingRoom.Booked:
        return const Color(0xFF3498DB);
      case StatusBookingRoom.Started:
        return const Color(0xFF2ECC71);
      case StatusBookingRoom.Ended:
        return const Color(0xFFE67E22);
      case StatusBookingRoom.Cancelled:
        return const Color(0xFFE74C3C);
      default:
        throw UnimplementedError(
            'This value status color nothing in enum extension');
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {});
        },
        child: Stack(
          children: [
            ListView(),
            ValueListenableBuilder(
              valueListenable: widget.valueListenable,
              // valueListenable: Hive.box<BookingRoom>(
              //         ConstantsLocalStorage.ActivityBookingRoom)
              //     .listenable(),
              builder: (context, Box<BookingRoom> box, child) {
                return box.isEmpty
                    ? SizedBox(
                        width: width * 0.95,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Image.asset(
                                'assets/images/empty_data.png',
                                height: height * 0.35,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25.0),
                              child: Column(
                                children: [
                                  Text(
                                    widget.title,
                                    style: const TextStyle(
                                      fontFamily: 'InconsolataRegular',
                                      fontSize: 23,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20.0),
                                    child: Text(
                                      widget.subTitle,
                                      style: const TextStyle(
                                        fontFamily: 'InconsolataRegular',
                                        color: Colors.black54,
                                        fontSize: 17,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: box.length,
                        itemBuilder: (context, index) {
                          final data = box.getAt(index)!;
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailActivityiew(
                                    bookingRoom: data,
                                    id: index,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                // border: Border.all(
                                //   color: const Color(0xFFBDC3C7),
                                // ),
                                color: Colors.white,
                                // color: const Color(0xFFEFEEEE),
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(-3.0, -3.0),
                                    blurRadius: 5,
                                    color: Colors.white.withOpacity(0.8),
                                  ),
                                  BoxShadow(
                                    offset: const Offset(3.0, 3.0),
                                    blurRadius: 5,
                                    color: Colors.black.withOpacity(0.1),
                                  )
                                ],
                              ),
                              margin: const EdgeInsets.fromLTRB(
                                  30.0, 30.0, 30.0, 30.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: const Offset(0, 5),
                                          color: Colors.black.withOpacity(0.5),
                                          blurRadius: 8.0,
                                        )
                                      ],
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(25),
                                      child: SizedBox(
                                        height: 150,
                                        width: double.infinity,
                                        child: Hero(
                                          tag: data.id,
                                          child: Image.asset(
                                            data.availableRoom.path,
                                            fit: BoxFit.fill,
                                            height: double.infinity,
                                            width: double.infinity,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.fromLTRB(
                                        20, 20, 20, 10),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data.availableRoom.title,
                                          style: primaryTextStyle().copyWith(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4.0),
                                          child: Text(
                                            data.availableRoom.subTitle,
                                            style: primaryTextStyle().copyWith(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 17,
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  const ContainerShadow(
                                                      content: 'Facilities'),
                                                  ...data
                                                      .availableRoom.facilitys
                                                      .map((facility) {
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 10.0),
                                                      child: Row(
                                                        children: [
                                                          Icon(getIcon(facility
                                                              .content)),
                                                          const SizedBox(
                                                            width: 10.0,
                                                          ),
                                                          Flexible(
                                                            child: Text(
                                                              facility.content,
                                                              style:
                                                                  primaryTextStyle(),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  }).toList()
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  const ContainerShadow(
                                                      content: 'Capacity'),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10.0),
                                                    child: Row(
                                                      children: [
                                                        Icon(Icons
                                                            .person_outline),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        Flexible(
                                                            child: Text(
                                                          '${data.availableRoom.capacity} people',
                                                          style:
                                                              primaryTextStyle(),
                                                        ))
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 30.0),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(Icons
                                                      .date_range_outlined),
                                                  const SizedBox(width: 10.0),
                                                  Text(data.date!,
                                                      style: primaryTextStyle())
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10.0),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(Icons.alarm),
                                                  const SizedBox(width: 10.0),
                                                  Text(data.time!,
                                                      style: primaryTextStyle())
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 7.0),
                                          child: Align(
                                            alignment: Alignment.bottomRight,
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10.0,
                                                      horizontal: 17.0),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: data.status != null
                                                    ? status(data.status!)
                                                    : null,
                                              ),
                                              child: Text(
                                                data.status != null
                                                    ? getStatus(data.status!)
                                                    : '',
                                                style:
                                                    primaryTextStyle().copyWith(
                                                  color: Colors.white,
                                                  fontSize: 17,
                                                  letterSpacing: 1.5,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
              },
            ),
            if (widget.isShowFAB) ...[
              Positioned(
                bottom: 22,
                right: 22,
                child: ShadowFAB(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BookingView(),
                      ),
                    );
                  },
                ),
              )
            ],
          ],
        ),
      ),
    );
  }
}
