// import 'package:booking_room_app/models/booking_room/booking_room.dart';
import 'package:booking_room_app/models/hive_adapter/booking_room.dart';
import 'package:booking_room_app/utils/local_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalStorageHive {
  static final _bookingActivityRoom =
      Hive.box<BookingRoom>(ConstantsLocalStorage.ActivityBookingRoom);

  static final _bookingHistoryRoom =
      Hive.box<BookingRoom>(ConstantsLocalStorage.HistoryBookingRoom);

  static final LocalStorageHive _instance = LocalStorageHive._internal();

  static Box<BookingRoom> get dataBoxActivity => _bookingActivityRoom;

  static Box<BookingRoom> get dataBoxHistory => _bookingHistoryRoom;

  LocalStorageHive._internal();

  factory LocalStorageHive() {
    return _instance;
  }

  // static ListBookingRoom get getListHistoryBookingRoom =>
  //     _bookingRoom.get(ConstantsLocalStorage.HistoryBookingRoom, []);

  // static List<BookingRoom>? get getListActivityBookingRoom =>
  //     _bookingRoom.get(ConstantsLocalStorage.ActivityBookingRoom);

  // static void setListActivityBookingRoom(List<BookingRoom> datas) =>
  //     _bookingRoom.put(ConstantsLocalStorage.ActivityBookingRoom, datas);

  // static void setListHistoryBookingRoom(List<BookingRoom> datas) => _bookingRoom
  //     .put(ConstantsLocalStorage.HistoryBookingRoom, datas as ListBookingRoom);

  static void clearBookingActivityRoom() => _bookingActivityRoom.clear();

  static void clearBookingHistoryRoom() => _bookingHistoryRoom.clear();
}
