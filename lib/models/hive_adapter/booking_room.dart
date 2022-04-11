// import 'package:booking_room_app/models/available_room/available_room.dart';
import 'package:booking_room_app/models/hive_adapter/available_room.dart';
import 'package:booking_room_app/utils/enums.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'booking_room.g.dart';

@HiveType(typeId: 0)
class BookingRoom {
  @HiveField(0)
  int id;

  @HiveField(1)
  AvailableRoom availableRoom;

  @HiveField(2)
  String? date;

  @HiveField(3)
  String? time;

  @HiveField(4)
  String? meetingTitle;

  @HiveField(5)
  String? meetingDescription;

  @HiveField(6)
  List<String>? guests;

  @HiveField(7)
  StatusBookingRoom? status;

  BookingRoom copyWith({
    String? meetingTitle,
    String? meetingDescription,
    List<String>? guests,
    StatusBookingRoom? status,
  }) {
    return BookingRoom(
      id: id,
      availableRoom: availableRoom,
      date: date,
      time: time,
      meetingTitle: meetingTitle,
      meetingDescription: meetingDescription,
      guests: guests,
      status: status,
    );
  }

  BookingRoom({
    required this.id,
    required this.availableRoom,
    this.date,
    this.time,
    this.meetingTitle,
    this.meetingDescription,
    this.guests,
    this.status,
  });
}
