import 'package:booking_room_app/data/local_storage.dart';
import 'package:booking_room_app/models/available_room/available_room.dart';
import 'package:booking_room_app/models/hive_adapter/available_room.dart';
// import 'package:booking_room_app/models/available_room/available_room.dart';
import 'package:booking_room_app/models/hive_adapter/booking_room.dart';
import 'package:booking_room_app/models/hive_adapter/facility_room.dart';
// import 'package:booking_room_app/models/booking_room/booking_room.dart';
import 'package:booking_room_app/utils/constants.dart';
import 'package:booking_room_app/utils/enums.dart';
import 'package:booking_room_app/views/detailed_room/widgets/button_shadow.dart';
import 'package:booking_room_app/views/detailed_room/widgets/image_room.dart';
import 'package:booking_room_app/views/detailed_room/widgets/header_shadow.dart';
import 'package:booking_room_app/views/menu/menu.dart';
import 'package:booking_room_app/widgets/container_shadow.dart';
import 'package:booking_room_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class DetailedRoomView extends StatefulWidget {
  const DetailedRoomView({required this.availableRoom, Key? key})
      : super(key: key);
  final AvailableRoomA availableRoom;

  @override
  State<DetailedRoomView> createState() => _DetailedRoomViewState();
}

class _DetailedRoomViewState extends State<DetailedRoomView> {
  final ValueNotifier<DateTime> dateNotifier =
      ValueNotifier<DateTime>(DateTime.now());
  final ValueNotifier<TimeOfDay> timeStartNotifier =
      ValueNotifier<TimeOfDay>(TimeOfDay.now());
  final ValueNotifier<TimeOfDay> timeEndNotifier =
      ValueNotifier<TimeOfDay>(TimeOfDay.now());
  final ValueNotifier<bool> isTapSubmitButtonNotifier =
      ValueNotifier<bool>(false);

  Future<void> onTapShowTimePicker(ValueNotifier<TimeOfDay> time) async {
    TimeOfDay initialTime = TimeOfDay.now();
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: initialTime,
      builder: (BuildContext context, Widget? child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
    );
    if (pickedTime != null) {
      time.value = pickedTime;
    }
  }

  Future<void> onTapShowDatePicker(ValueNotifier<DateTime> dateN) async {
    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: DateTime.now(),
      maxTime: DateTime.now().add(const Duration(days: 368)),
      onChanged: (date) {},
      onConfirm: (date) {
        dateN.value = date;
      },
      currentTime: DateTime.now(),
      locale: LocaleType.en,
    );
  }

  String onConvertDateText(DateTime data) =>
      '${Constants.NameDayEnUS[data.weekday - 1]}, ${data.day} ${Constants.NameMonthEnUs[data.month - 1]} ${data.year}';

  String onConvertTimeText(TimeOfDay data) {
    String hour = '${data.hour}';
    String minute = '${data.minute}';
    if (hour.length < 2) {
      hour = '0$hour';
    }
    if (minute.length < 2) {
      minute = '0$minute';
    }
    return '$hour:$minute';
  }

  void handleTapButton() =>
      isTapSubmitButtonNotifier.value = !isTapSubmitButtonNotifier.value;

  Future<void> onSubmitButton() async {
    // final bookingRoom = BookingRoom(
    //   id: widget.availableRoom.id,
    //   availableRoom: AvailableRoom(
    //     id: widget.availableRoom.id,
    //     path: widget.availableRoom.path,
    //     title: widget.availableRoom.title,
    //     subTitle: widget.availableRoom.subTitle,
    //     facilitys: widget.availableRoom.facilitys,
    //     capacity: widget.availableRoom.capacity,
    //   ),
    //   date: onConvertDateText(dateNotifier.value),
    //   time:
    //       '${onConvertTimeText(timeStartNotifier.value)} - ${onConvertTimeText(timeEndNotifier.value)}',
    //   status: StatusBookingRoom.Booked,
    // );

    // await LocalStorageHive.dataBoxActivity.clear();
    final List<FacilityRoom> arrFacilitys = [];
    final facilitys = widget.availableRoom.facilitys;
    for (int x = 0; x < facilitys.length; x++) {
      arrFacilitys.add(FacilityRoom(content: facilitys[x].content));
    }
    final id = DateTime.now().millisecondsSinceEpoch;
    BookingRoom data = BookingRoom(
      id: id,
      availableRoom: AvailableRoom(
        id: id,
        path: widget.availableRoom.path,
        title: widget.availableRoom.title,
        subTitle: widget.availableRoom.subTitle,
        facilitys: arrFacilitys,
        capacity: widget.availableRoom.capacity,
      ),
      date: onConvertDateText(dateNotifier.value),
      time:
          '${onConvertTimeText(timeStartNotifier.value)} - ${onConvertTimeText(timeEndNotifier.value)}',
      status: StatusBookingRoom.Booked,
      guests: <String>[
        'rafly.avianto@sinarmasmining.com',
      ],
    );
    await LocalStorageHive.dataBoxActivity.add(data);
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const MenuView()),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFEEEE),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: ImageRoom(
              id: widget.availableRoom.id,
              maxExtentHeight: 480,
              minExtentHeight: 115,
              pathImage: widget.availableRoom.path,
              title: widget.availableRoom.title,
              subTitle: widget.availableRoom.subTitle,
            ),
            pinned: true,
            floating: false,
          ),
          SliverList(
            delegate: SliverChildListDelegate.fixed([
              const SizedBox(
                height: 20,
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
                          ...widget.availableRoom.facilitys.map((facility) {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(top: 10.0, left: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    facility.icon,
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
                            padding: const EdgeInsets.only(top: 10.0, left: 10),
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
                                  '${widget.availableRoom.capacity} people',
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
              const HeaderShadow(
                margin: EdgeInsets.fromLTRB(15.0, 55.0, 15.0, 20.0),
                content: 'Schedule',
              ),
              Container(
                margin: const EdgeInsets.only(top: 25.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HeaderShadow(
                      margin: EdgeInsets.only(
                        left: 15.0,
                      ),
                      content: 'Date',
                      width: 80,
                    ),
                    ValueListenableBuilder(
                        valueListenable: dateNotifier,
                        builder: (context, DateTime value, Widget? _) {
                          return ButtonShadow(
                            margin: const EdgeInsets.fromLTRB(
                                15.0, 20.0, 15.0, 0.0),
                            content: onConvertDateText(value),
                            icon: Icons.date_range_outlined,
                            onTap: () async =>
                                onTapShowDatePicker(dateNotifier),
                          );
                        }),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 45.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HeaderShadow(
                      margin: EdgeInsets.only(
                        left: 15.0,
                      ),
                      content: 'Start',
                      width: 80,
                    ),
                    ValueListenableBuilder(
                        valueListenable: timeStartNotifier,
                        builder: (context, TimeOfDay value, Widget? _) {
                          return ButtonShadow(
                            margin: const EdgeInsets.fromLTRB(
                                15.0, 20.0, 15.0, 0.0),
                            content: onConvertTimeText(value),
                            icon: Icons.access_alarm_rounded,
                            onTap: () async =>
                                onTapShowTimePicker(timeStartNotifier),
                          );
                        }),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 45.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HeaderShadow(
                      margin: EdgeInsets.only(
                        left: 15.0,
                      ),
                      content: 'End',
                      width: 80,
                    ),
                    ValueListenableBuilder(
                        valueListenable: timeEndNotifier,
                        builder: (context, TimeOfDay value, Widget? _) {
                          return ButtonShadow(
                            margin: const EdgeInsets.fromLTRB(
                                15.0, 20.0, 15.0, 0.0),
                            content: onConvertTimeText(value),
                            icon: Icons.access_alarm_rounded,
                            onTap: () async =>
                                onTapShowTimePicker(timeEndNotifier),
                          );
                        }),
                  ],
                ),
              ),
              _ButtonSubmit(
                onTap: () async => await onSubmitButton(),
                margin: EdgeInsets.fromLTRB(
                  15.0,
                  55.0,
                  15.0,
                  30.0,
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}

class _ButtonSubmit extends StatefulWidget {
  const _ButtonSubmit({required this.onTap, this.margin, Key? key})
      : super(key: key);

  final EdgeInsets? margin;
  final Function() onTap;

  @override
  State<_ButtonSubmit> createState() => _ButtonSubmitState();
}

class _ButtonSubmitState extends State<_ButtonSubmit> {
  bool isTapButton = false;

  void handleTapButton() {
    setState(() => isTapButton = !isTapButton);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          widget.onTap();
        },
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
              'BOOK THIS ROOM',
              style: primaryTextStyle().copyWith(
                color: Colors.black54,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ));
  }
}
