import 'package:hive_flutter/adapters.dart';

part 'enums.g.dart';

@HiveType(typeId: 3)
enum StatusBookingRoom {
  @HiveField(0)
  Booked,
  @HiveField(1)
  Started,
  @HiveField(2)
  Ended,
  @HiveField(3)
  Cancelled,
}
