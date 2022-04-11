import 'package:booking_room_app/data/local_storage.dart';
import 'package:booking_room_app/models/hive_adapter/booking_room.dart';
import 'package:booking_room_app/utils/constants.dart';
import 'package:booking_room_app/utils/enums.dart';
import 'package:booking_room_app/utils/local_storage.dart';
import 'package:booking_room_app/views/detail_activity/widget/bottom_sheet.dart';
import 'package:booking_room_app/views/detail_activity/widget/icon_button.dart';
import 'package:booking_room_app/views/detail_activity/widget/text_content.dart';
import 'package:booking_room_app/views/detailed_room/widgets/image_room.dart';
import 'package:booking_room_app/widgets/container_shadow.dart';
import 'package:booking_room_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:booking_room_app/functions/extensions.dart';

class DetailActivityiew extends StatefulWidget {
  const DetailActivityiew(
      {required this.id, required this.bookingRoom, Key? key})
      : super(key: key);
  final BookingRoom bookingRoom;
  final int id;

  @override
  State<DetailActivityiew> createState() => _DetailActivityiewState();
}

class _DetailActivityiewState extends State<DetailActivityiew> {
  final ValueNotifier<String?> titleNotifier = ValueNotifier<String?>(null);
  final ValueNotifier<String?> descriptionNotifier =
      ValueNotifier<String?>(null);
  final ValueNotifier<List<String>> listGuestsNotifier =
      ValueNotifier<List<String>>([]);
  // final ValueNotifier<StatusBookingRoom> statu

  @override
  void dispose() {
    titleNotifier.dispose();
    descriptionNotifier.dispose();
    // listGuestsNotifier.value.clear();
    listGuestsNotifier.dispose();
    super.dispose();
  }

  @override
  void initState() {
    if (widget.bookingRoom.guests != null) {
      listGuestsNotifier.value = widget.bookingRoom.guests!;
    }
    if (widget.bookingRoom.meetingTitle != null) {
      titleNotifier.value = widget.bookingRoom.meetingTitle!;
    }
    if (widget.bookingRoom.meetingDescription != null) {
      descriptionNotifier.value = widget.bookingRoom.meetingDescription!;
    }
    super.initState();
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
    return Scaffold(
      backgroundColor: const Color(0xFFEFEEEE),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: ImageRoom(
              id: widget.bookingRoom.availableRoom.id,
              maxExtentHeight: 480,
              minExtentHeight: 115,
              pathImage: widget.bookingRoom.availableRoom.path,
              title: widget.bookingRoom.availableRoom.title,
              subTitle: widget.bookingRoom.availableRoom.subTitle,
            ),
            pinned: true,
            floating: false,
          ),
          SliverList(
            delegate: SliverChildListDelegate.fixed(
              [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 0.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 17.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          // color: const Color(0xFFE74C3C),
                          // color: const Color(0xFF2ECC71),
                          color: widget.bookingRoom.status != null
                              ? status(widget.bookingRoom.status!)
                              : null,
                        ),
                        child: Text(
                          getStatus(widget.bookingRoom.status!),
                          style: primaryTextStyle().copyWith(
                            color: Colors.white,
                            fontSize: 17,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const ContainerShadow(content: 'Facilities'),
                            ...widget.bookingRoom.availableRoom.facilitys
                                .map((facility) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(top: 10.0, left: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      getIcon(facility.content),
                                      // facility.icon,
                                      color: Colors.black54,
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    Flexible(
                                      child: Text(
                                        facility.content,
                                        style: primaryTextStyle().copyWith(
                                          color: Colors.black54,
                                        ),
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
                          children: [
                            const ContainerShadow(content: 'Capacity'),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10.0, left: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.person_outline,
                                    color: Colors.black54,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Flexible(
                                      child: Text(
                                    '${widget.bookingRoom.availableRoom.capacity} people',
                                    style: primaryTextStyle().copyWith(
                                      color: Colors.black54,
                                    ),
                                  ))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                TextContent(
                  prefixField: 'Date',
                  content: widget.bookingRoom.date!,
                  margin: const EdgeInsets.fromLTRB(20.0, 55.0, 20.0, 20.0),
                ),
                TextContent(
                  prefixField: 'Time',
                  content: widget.bookingRoom.time!,
                  margin: const EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 20.0),
                ),
                Container(
                  height: 10,
                  color: const Color(0xFF7F8C8D),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 20.0),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Meeting Details',
                            style: primaryTextStyle().copyWith(
                                fontSize: 20,
                                color: Colors.black54,
                                fontWeight: FontWeight.w600),
                          ),
                          if (widget.bookingRoom.status ==
                              StatusBookingRoom.Booked) ...[
                            Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: IconButtonShadow(
                                onTap: () {
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(25),
                                        topRight: Radius.circular(25),
                                      ),
                                    ),
                                    context: context,
                                    builder: (context) {
                                      return ContainerDetailBottomSheet(
                                        listGuestsNotifier: listGuestsNotifier,
                                        id: widget.id,
                                        titleNotifier: titleNotifier,
                                        bookingRoom: widget.bookingRoom,
                                        descriptionNotifier:
                                            descriptionNotifier,
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: ValueListenableBuilder(
                          valueListenable: titleNotifier,
                          builder: (context, String? value, child) {
                            return TextField(
                              enabled: false,
                              controller: TextEditingController()
                                ..text = value ?? '',
                              decoration: InputDecoration(
                                label: Text(
                                  'Meeting Title',
                                  style: primaryTextStyle().copyWith(
                                      fontSize: 17,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Description',
                            style: primaryTextStyle().copyWith(
                                fontSize: 17,
                                color: Colors.black54,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      ValueListenableBuilder(
                        valueListenable: descriptionNotifier,
                        builder: (context, String? value, child) {
                          return TextField(
                            minLines: 4,
                            maxLines: 6,
                            controller: TextEditingController()
                              ..text = value ?? '',
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    const BorderSide(color: Colors.transparent),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    const BorderSide(color: Colors.transparent),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    const BorderSide(color: Colors.transparent),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    const BorderSide(color: Colors.transparent),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    const BorderSide(color: Colors.transparent),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    const BorderSide(color: Colors.transparent),
                              ),
                              enabled: false,
                              filled: true,
                              fillColor:
                                  const Color(0xFF34495E).withOpacity(0.2),
                              hintText: 'No Description',
                              hintStyle: primaryTextStyle().copyWith(
                                  fontSize: 17,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w600),
                            ),
                          );
                        },
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(top: 40.0, bottom: 10.0),
                          child: Text(
                            'Guest (${widget.bookingRoom.guests?.length ?? 0})',
                            style: primaryTextStyle().copyWith(
                                fontSize: 17,
                                color: Colors.black54,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      ValueListenableBuilder(
                        valueListenable: listGuestsNotifier,
                        builder: (context, value, child) {
                          return Column(
                            children: [
                              ...listGuestsNotifier.value
                                  .mapIndexed((int index, String val) {
                                return Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(10.0),
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFF34495E),
                                      ),
                                      child: Text(
                                        '${index + 1}',
                                        style: primaryTextStyle()
                                            .copyWith(color: Colors.white),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(val,
                                          style: primaryTextStyle()
                                              .copyWith(fontSize: 17)),
                                    )
                                  ],
                                );
                              }).toList()
                            ],
                          );
                        },
                      ),
                      if (widget.bookingRoom.status ==
                              StatusBookingRoom.Booked ||
                          widget.bookingRoom.status ==
                              StatusBookingRoom.Started) ...[
                        _ButtonSubmit(
                          data: LocalStorageHive.dataBoxActivity
                              .getAt(widget.id) as BookingRoom,
                          id: widget.id,
                          content: widget.bookingRoom.status ==
                                  StatusBookingRoom.Booked
                              ? 'START'
                              : 'ENDED',
                          margin: const EdgeInsets.fromLTRB(
                            0.0,
                            55.0,
                            0.0,
                            30.0,
                          ),
                        ),
                      ],
                      if (widget.bookingRoom.status ==
                          StatusBookingRoom.Booked) ...[
                        _ButtonCancel(
                          id: widget.id,
                          content: 'CANCEL THIS BOOKING',
                          margin: const EdgeInsets.fromLTRB(
                            0.0,
                            0.0,
                            0.0,
                            30.0,
                          ),
                        ),
                      ]
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ButtonSubmit extends StatefulWidget {
  const _ButtonSubmit(
      {required this.data,
      required this.id,
      required this.content,
      this.margin,
      Key? key})
      : super(key: key);

  final EdgeInsets? margin;
  final String content;
  final int id;
  final BookingRoom data;

  @override
  State<_ButtonSubmit> createState() => _ButtonSubmitState();
}

class _ButtonSubmitState extends State<_ButtonSubmit> {
  bool isTapButton = false;

  void handleTapButton() {
    setState(() => isTapButton = !isTapButton);
  }

  Future<void> onTap() async {
    final data =
        LocalStorageHive.dataBoxActivity.getAt(widget.id) as BookingRoom;
    if (data.status == StatusBookingRoom.Booked) {
      await LocalStorageHive.dataBoxActivity.putAt(
        widget.id,
        widget.data.copyWith(
          status: StatusBookingRoom.Started,
          guests: data.guests!,
          meetingDescription: data.meetingDescription,
          meetingTitle: data.meetingTitle,
        ),
      );
    } else if (data.status == StatusBookingRoom.Started) {
      await LocalStorageHive.dataBoxHistory.add(
        data.copyWith(
          status: StatusBookingRoom.Ended,
          guests: data.guests!,
          meetingDescription: data.meetingDescription,
          meetingTitle: data.meetingTitle,
        ),
      );
      await LocalStorageHive.dataBoxActivity.deleteAt(widget.id);
    }
    Navigator.pop(context);
  }

  Color status(StatusBookingRoom data) {
    switch (data) {
      case StatusBookingRoom.Booked:
        return const Color(0xFF34495E);
      case StatusBookingRoom.Started:
        return const Color(0xFFE74C3C);
      default:
        throw UnimplementedError('This value nothing in enum extension');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async => await onTap(),
      onTapDown: (_) {
        handleTapButton();
      },
      onTapUp: (_) {
        handleTapButton();
      },
      onTapCancel: () {
        handleTapButton();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(10.0),
        margin: widget.margin,
        decoration: BoxDecoration(
          color: isTapButton
              ? status(widget.data.status!).withOpacity(0.5)
              : status(widget.data.status!),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            widget.content,
            style: primaryTextStyle().copyWith(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

class _ButtonCancel extends StatefulWidget {
  const _ButtonCancel(
      {required this.id, required this.content, this.margin, Key? key})
      : super(key: key);

  final EdgeInsets? margin;
  final String content;
  final int id;

  @override
  State<_ButtonCancel> createState() => _ButtonCancelState();
}

class _ButtonCancelState extends State<_ButtonCancel> {
  bool isTapButton = false;

  void handleTapButton() {
    setState(() => isTapButton = !isTapButton);
  }

  Future<void> onTap() async {
    final data =
        LocalStorageHive.dataBoxActivity.getAt(widget.id) as BookingRoom;
    await LocalStorageHive.dataBoxHistory.add(
      data.copyWith(
        status: StatusBookingRoom.Cancelled,
        guests: data.guests!,
        meetingDescription: data.meetingDescription,
        meetingTitle: data.meetingTitle,
      ),
    );
    await LocalStorageHive.dataBoxActivity.deleteAt(widget.id);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async => await onTap(),
      onTapDown: (_) {
        handleTapButton();
      },
      onTapUp: (_) {
        handleTapButton();
      },
      onTapCancel: () {
        handleTapButton();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(10.0),
        margin: widget.margin,
        decoration: BoxDecoration(
          color: const Color(0xFFEFEEEE),
          borderRadius: BorderRadius.circular(20),
          boxShadow: isTapButton
              ? [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: const Offset(-2.0, -2.0),
                      blurRadius: 6.0,
                      spreadRadius: 3),
                  BoxShadow(
                    color: Colors.white.withOpacity(0.9),
                    offset: const Offset(6.0, 6.0),
                    blurRadius: 6.0,
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(6.0, 6.0),
                    blurRadius: 6.0,
                  ),
                  BoxShadow(
                    color: Colors.white.withOpacity(0.9),
                    offset: const Offset(-6.0, -6.0),
                    blurRadius: 6.0,
                  ),
                ],
        ),
        child: Center(
          child: Text(
            widget.content,
            style: primaryTextStyle().copyWith(
              color: Colors.black54,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
