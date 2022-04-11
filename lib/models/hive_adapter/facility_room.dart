import 'package:booking_room_app/models/hive_adapter/available_room.dart';
import 'package:booking_room_app/utils/enums.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'facility_room.g.dart';

@HiveType(typeId: 2)
class FacilityRoom {
  @HiveField(0)
  String content;
  FacilityRoom({required this.content});
}
