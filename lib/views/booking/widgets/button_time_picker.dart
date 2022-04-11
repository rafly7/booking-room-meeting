import 'package:booking_room_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ButtonTimePicker extends StatefulWidget {
  const ButtonTimePicker({Key? key}) : super(key: key);

  @override
  State<ButtonTimePicker> createState() => _ButtonTimePickerState();
}

class _ButtonTimePickerState extends State<ButtonTimePicker> {
  bool isTapButton = false;

  final ValueNotifier<TimeOfDay> timeNotifier =
      ValueNotifier<TimeOfDay>(TimeOfDay.now());

  void handleTapButton() {
    setState(() => isTapButton = !isTapButton);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapCancel: () {
        handleTapButton();
      },
      onTapDown: (_) {
        handleTapButton();
      },
      onTapUp: (_) {
        handleTapButton();
      },
      onTap: () async {
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
          timeNotifier.value = pickedTime;
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.only(right: 15.0, top: 15.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: isTapButton ? const Color(0xFFBDC3C7) : null,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isTapButton ? Colors.transparent : Colors.black54,
            width: 1,
          ),
        ),
        child: Center(
          child: ValueListenableBuilder(
              valueListenable: timeNotifier,
              builder: (context, TimeOfDay value, Widget? child) {
                return Text(
                  '${value.hour} : ${value.minute}',
                  style: primaryTextStyle().copyWith(
                    color: isTapButton ? Colors.white : Colors.black54,
                    fontSize: 18,
                  ),
                );
              }),
        ),
      ),
    );
  }
}
