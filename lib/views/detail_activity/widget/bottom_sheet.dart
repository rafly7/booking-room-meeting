import 'package:booking_room_app/data/local_storage.dart';
import 'package:booking_room_app/functions/extensions.dart';
import 'package:booking_room_app/models/hive_adapter/booking_room.dart';
import 'package:booking_room_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ContainerDetailBottomSheet extends StatefulWidget {
  const ContainerDetailBottomSheet(
      {required this.id,
      required this.titleNotifier,
      required this.descriptionNotifier,
      required this.bookingRoom,
      required this.listGuestsNotifier,
      Key? key})
      : super(key: key);

  final BookingRoom bookingRoom;
  final ValueNotifier<String?> titleNotifier;
  final ValueNotifier<String?> descriptionNotifier;
  final ValueNotifier<List<String>>? listGuestsNotifier;
  final int id;

  @override
  State<ContainerDetailBottomSheet> createState() =>
      ContainerDetailBottomSheetState();
}

class ContainerDetailBottomSheetState
    extends State<ContainerDetailBottomSheet> {
  // static late List<String> guestsBookingRoom = [];

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController addGuestController = TextEditingController();

  final ValueNotifier<List<String>> guestsNotifier =
      ValueNotifier<List<String>>([]);

  @override
  void initState() {
    if (widget.bookingRoom.guests != null) {
      guestsNotifier.value.addAll(widget.bookingRoom.guests!);
    }
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    addGuestController.dispose();
    guestsNotifier.dispose();
    super.dispose();
  }

  Future<void> onDoneButton() async {
    widget.titleNotifier.value = titleController.text;
    widget.descriptionNotifier.value = descriptionController.text;
    widget.listGuestsNotifier?.value = guestsNotifier.value;
    await LocalStorageHive.dataBoxActivity.putAt(
      widget.id,
      widget.bookingRoom.copyWith(
        status: widget.bookingRoom.status,
        meetingTitle: titleController.text,
        meetingDescription: descriptionController.text,
        guests: guestsNotifier.value,
      ),
    );
    Navigator.pop(context);
  }

  void onDoneTextField() async {
    if (addGuestController.text.isNotEmpty) {
      guestsNotifier.value.add(addGuestController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(35.0, 30.0, 35.0, 10.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Information Schedule',
                    style: primaryTextStyle().copyWith(
                        fontSize: 19,
                        color: Colors.black54,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Date',
                        style: primaryTextStyle().copyWith(
                            fontSize: 17,
                            color: Colors.black54,
                            fontWeight: FontWeight.w600),
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          icon: Icon(
                            Icons.date_range_outlined,
                            color: Colors.black54,
                          ),
                          contentPadding: EdgeInsets.only(top: 10, bottom: 5),
                        ),
                        readOnly: true,
                        controller: TextEditingController()
                          ..text = widget.bookingRoom.date!,
                        style: primaryTextStyle().copyWith(
                          color: Colors.black54,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Start',
                        style: primaryTextStyle().copyWith(
                            fontSize: 17,
                            color: Colors.black54,
                            fontWeight: FontWeight.w600),
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          icon: Icon(
                            Icons.alarm,
                            color: Colors.black54,
                          ),
                          contentPadding: EdgeInsets.only(top: 10, bottom: 5),
                        ),
                        readOnly: true,
                        controller: TextEditingController()
                          ..text = widget.bookingRoom.time!.split(' - ')[0],
                        style: primaryTextStyle().copyWith(
                          color: Colors.black54,
                        ),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'End',
                          style: primaryTextStyle().copyWith(
                              fontSize: 17,
                              color: Colors.black54,
                              fontWeight: FontWeight.w600),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.alarm,
                              color: Colors.black54,
                            ),
                            contentPadding:
                                const EdgeInsets.only(top: 10, bottom: 5),
                          ),
                          readOnly: true,
                          controller: TextEditingController()
                            ..text = widget.bookingRoom.time!.split(' - ')[1],
                          style: primaryTextStyle().copyWith(
                            color: Colors.black54,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 10,
            color: const Color(0xFF7F8C8D),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(35.0, 10.0, 35.0, 10.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Meeting Title',
                        style: primaryTextStyle().copyWith(
                          fontSize: 17,
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextField(
                        controller: titleController,
                        decoration: InputDecoration(
                          hintText: '-',
                          hintStyle: primaryTextStyle().copyWith(
                            fontSize: 17,
                            color: Colors.black38,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Description',
                        style: primaryTextStyle().copyWith(
                          fontSize: 17,
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextField(
                        controller: descriptionController,
                        decoration: InputDecoration(
                          hintText: 'Enter Your Meeting Description',
                          hintStyle: primaryTextStyle().copyWith(
                            fontSize: 17,
                            color: Colors.black38,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Add Guest',
                        style: primaryTextStyle().copyWith(
                          fontSize: 17,
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextField(
                        textInputAction: TextInputAction.done,
                        onSubmitted: (value) {
                          onDoneTextField();
                        },
                        controller: addGuestController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          helperText: 'Press enter to add guest',
                          helperStyle: primaryTextStyle().copyWith(
                            fontSize: 13,
                            color: const Color(0xFFE74C3C),
                          ),
                          hintText: 'Enter Your Guest Mail',
                          hintStyle: primaryTextStyle().copyWith(
                            fontSize: 17,
                            color: Colors.black38,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, bottom: 22.0),
                  child: ValueListenableBuilder(
                      valueListenable: guestsNotifier,
                      builder: (context, List<String> val, Widget? child) {
                        return Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 15.0),
                                child: Text(
                                  'Added Guests',
                                  style: primaryTextStyle().copyWith(
                                    fontSize: 17,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            // if (widget.bookingRoom.guests != null) ...[
                            ...val.mapIndexed((int index, String val) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: const Color(0xFF34495E)),
                                      child: Text(
                                        '${index + 1}',
                                        style: primaryTextStyle()
                                            .copyWith(color: Colors.white),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(val,
                                            style: primaryTextStyle()
                                                .copyWith(fontSize: 17)),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(4.0),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: const Color(0xFF34495E)),
                                      child: Icon(
                                        Icons.clear,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList()
                            // ],
                          ],
                        );
                      }),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async => await onDoneButton(),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(vertical: 8.0),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xFF1ABC9C))),
                    child: Text(
                      'DONE',
                      style: primaryTextStyle().copyWith(
                        color: Colors.white,
                        fontSize: 19,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
