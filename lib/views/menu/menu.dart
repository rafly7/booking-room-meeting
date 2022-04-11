import 'package:booking_room_app/models/hive_adapter/booking_room.dart';
import 'package:booking_room_app/utils/local_storage.dart';
import 'package:booking_room_app/views/activity/activity.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MenuView extends StatefulWidget {
  const MenuView({Key? key}) : super(key: key);

  static final List<Widget> _widgetOptions = <Widget>[
    ActivityView(
      title: 'Empty data no activity to be shown...',
      subTitle:
          'Book one from button corner right to make booking room in activity, We would gladly fullfil your request,',
      isShowFAB: true,
      valueListenable:
          Hive.box<BookingRoom>(ConstantsLocalStorage.ActivityBookingRoom)
              .listenable(),
    ),
    ActivityView(
      title: 'Empty data no history to be shown...',
      subTitle: 'Book one from the activity menu to make booking room',
      valueListenable:
          Hive.box<BookingRoom>(ConstantsLocalStorage.HistoryBookingRoom)
              .listenable(),
    ),
  ];

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  int _selectIndex = 0;

  void _onItemTapped(int index) {
    setState(() => _selectIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
          children: MenuView._widgetOptions,
          index: _selectIndex,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xFFFFFFFF),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.article), label: 'Activity'),
            BottomNavigationBarItem(
                icon: Icon(Icons.history), label: 'History'),
          ],
          currentIndex: _selectIndex,
          onTap: _onItemTapped,
          selectedItemColor: const Color(0xFF5352ED),
        ),
      ),
    );
  }
}
