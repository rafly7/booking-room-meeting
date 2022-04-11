import 'package:booking_room_app/models/facility_room/facility_room.dart';

class AvailableRoomA {
  int id;
  String path;
  String title;
  String subTitle;
  List<FacilityRoomA> facilitys;
  int capacity;
  AvailableRoomA({
    required this.id,
    required this.path,
    required this.title,
    required this.subTitle,
    required this.facilitys,
    required this.capacity,
  });
}

// class FacilityRoomA {
//   IconData icon;
//   String content;
//   FacilityRoomA({required this.icon, required this.content});
// }
