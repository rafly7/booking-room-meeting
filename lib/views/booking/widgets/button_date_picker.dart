import 'package:booking_room_app/utils/constants.dart';
import 'package:booking_room_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class ButtonDatePicker extends StatefulWidget {
  const ButtonDatePicker({Key? key}) : super(key: key);

  @override
  State<ButtonDatePicker> createState() => _ButtonDatePickerState();
}

class _ButtonDatePickerState extends State<ButtonDatePicker> {
  bool isTapButton = false;

  final ValueNotifier<DateTime> dateNotifier =
      ValueNotifier<DateTime>(DateTime.now());

  String onConvertText(DateTime data) {
    return '${Constants.NameDayEnUS[data.weekday - 1]}, ${data.day} ${Constants.NameMonthEnUs[data.month - 1]} ${data.year}';
  }

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
      onTap: () {
        DatePicker.showDatePicker(
          context,
          showTitleActions: true,
          minTime: DateTime.now(),
          maxTime: DateTime.now().add(const Duration(days: 368)),
          onChanged: (date) {},
          onConfirm: (date) {
            dateNotifier.value = date;
          },
          currentTime: DateTime.now(),
          locale: LocaleType.en,
        );
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
              valueListenable: dateNotifier,
              builder: (context, DateTime value, Widget? child) {
                return Text(
                  onConvertText(value),
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
