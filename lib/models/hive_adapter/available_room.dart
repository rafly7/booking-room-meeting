import 'package:booking_room_app/models/available_room/available_room.dart';
import 'package:booking_room_app/models/hive_adapter/facility_room.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'available_room.g.dart';

@HiveType(typeId: 1)
class AvailableRoom {
  @HiveField(0)
  int id;

  @HiveField(1)
  String path;

  @HiveField(2)
  String title;

  @HiveField(3)
  String subTitle;

  @HiveField(4)
  List<FacilityRoom> facilitys;

  @HiveField(5)
  int capacity;
  AvailableRoom({
    required this.id,
    required this.path,
    required this.title,
    required this.subTitle,
    required this.facilitys,
    required this.capacity,
  });
}
