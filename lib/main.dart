// import 'package:booking_room_app/models/booking_room/booking_room.dart';
import 'package:booking_room_app/data/local_storage.dart';
import 'package:booking_room_app/models/hive_adapter/available_room.dart';
import 'package:booking_room_app/models/hive_adapter/booking_room.dart';
import 'package:booking_room_app/models/hive_adapter/facility_room.dart';
import 'package:booking_room_app/utils/enums.dart';
import 'package:booking_room_app/utils/local_storage.dart';
import 'package:booking_room_app/views/menu/menu.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  // await Hive.close();
  print(DateTime.now().millisecondsSinceEpoch);
  Hive.registerAdapter(BookingRoomAdapter());
  Hive.registerAdapter(AvailableRoomAdapter());
  Hive.registerAdapter(FacilityRoomAdapter());
  Hive.registerAdapter(StatusBookingRoomAdapter());
  await Hive.openBox<BookingRoom>(ConstantsLocalStorage.ActivityBookingRoom);
  await Hive.openBox<BookingRoom>(ConstantsLocalStorage.HistoryBookingRoom);
  await LocalStorageHive.dataBoxActivity.clear();
  await LocalStorageHive.dataBoxHistory.clear();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MenuView(),
    );
  }
}
