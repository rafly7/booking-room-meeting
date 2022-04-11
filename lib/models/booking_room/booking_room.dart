import 'package:booking_room_app/models/available_room/available_room.dart';
import 'package:booking_room_app/utils/enums.dart';

class BookingRoomA {
  int id;
  AvailableRoomA availableRoom;
  String? date;
  String? time;
  String? meetingTitle;
  String? meetingDescription;
  List<String>? guests;
  StatusBookingRoom? status;
  BookingRoomA({
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
