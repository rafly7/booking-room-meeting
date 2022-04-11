// import 'package:booking_room_app/models/available_room/available_room.dart';
// import 'package:booking_room_app/models/hive_adapter/available_room.dart';
import 'package:booking_room_app/models/available_room/available_room.dart';
import 'package:booking_room_app/models/facility_room/facility_room.dart';
// import 'package:booking_room_app/models/hive_adapter/available_room.dart';
// import 'package:booking_room_app/models/hive_adapter/facility_room.dart';
// import 'package:booking_room_app/models/hive_adapter/facility_room.dart';
import 'package:booking_room_app/views/detailed_room/detailed_room.dart';
import 'package:booking_room_app/widgets/container_shadow.dart';
import 'package:booking_room_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';

final List<AvailableRoomA> rooms = [
  AvailableRoomA(
    id: 1,
    path: 'assets/images/meeting_room1.png',
    capacity: 7,
    title: 'Meeting Room 10A',
    subTitle: 'MSIG Tower 10th Floor',
    facilitys: [
      FacilityRoomA(icon: Icons.videocam_outlined, content: 'Vicon'),
      FacilityRoomA(icon: Icons.cable_outlined, content: 'HDMI'),
    ],
  ),
  AvailableRoomA(
    id: 2,
    path: 'assets/images/meeting_room2.png',
    capacity: 5,
    title: 'Meeting Room 10B',
    subTitle: 'MSIG Tower 10th Floor',
    facilitys: [
      FacilityRoomA(icon: Icons.tv, content: 'LED TV'),
    ],
  ),
  AvailableRoomA(
    id: 3,
    path: 'assets/images/meeting_room3.png',
    capacity: 15,
    title: 'Meeting Room 11A',
    subTitle: 'MSIG Tower 11th Floor',
    facilitys: [
      FacilityRoomA(icon: Icons.wifi_rounded, content: 'Wireless Presentation'),
      FacilityRoomA(icon: Icons.tv, content: 'LED TV'),
    ],
  ),
  AvailableRoomA(
    id: 4,
    path: 'assets/images/meeting_room4.png',
    capacity: 20,
    title: 'Meeting Room 11B',
    subTitle: 'MSIG Tower 11th Floor',
    facilitys: [
      FacilityRoomA(icon: Icons.wifi_rounded, content: 'Wireless Presentation'),
      FacilityRoomA(icon: Icons.tv, content: 'LED TV'),
      FacilityRoomA(icon: Icons.videocam_outlined, content: 'Vicon'),
      FacilityRoomA(icon: Icons.cable_outlined, content: 'HDMI'),
    ],
  )
];

class AvailableRoomView extends StatelessWidget {
  const AvailableRoomView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        // backgroundColor: const Color(0xFF2980B9),
        backgroundColor: const Color(0xFFEFEEEE),
        // appBar: PreferredSize(child: Tex, preferredSize: preferredSize),
        body: ListView(
          padding: const EdgeInsets.only(top: 40.0, bottom: 10),
          children: [
            ...rooms.asMap().entries.map<Widget>((val) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailedRoomView(
                                availableRoom: val.value,
                              )));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    // border: Border.all(
                    //   color: const Color(0xFFBDC3C7),
                    // ),
                    color: const Color(0xFFEFEEEE),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(-3.0, -3.0),
                        blurRadius: 5,
                        color: Colors.white.withOpacity(0.8),
                      ),
                      BoxShadow(
                        offset: const Offset(3.0, 3.0),
                        blurRadius: 5,
                        color: Colors.black.withOpacity(0.1),
                      )
                    ],
                  ),
                  margin: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 30.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 5),
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 8.0,
                            )
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: SizedBox(
                            height: 150,
                            width: double.infinity,
                            child: Hero(
                              tag: val.value.id,
                              child: Image.asset(
                                val.value.path,
                                fit: BoxFit.fill,
                                height: double.infinity,
                                width: double.infinity,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                val.value.title,
                                style: primaryTextStyle().copyWith(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4.0),
                                child: Text(
                                  val.value.subTitle,
                                  style: primaryTextStyle().copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17,
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const ContainerShadow(
                                            content: 'Facilities'),
                                        ...val.value.facilitys.map((facility) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0),
                                            child: Row(
                                              children: [
                                                Icon(facility.icon),
                                                const SizedBox(
                                                  width: 10.0,
                                                ),
                                                Flexible(
                                                  child: Text(
                                                    facility.content,
                                                    style: primaryTextStyle(),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        }).toList()
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const ContainerShadow(
                                            content: 'Capacity'),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10.0),
                                          child: Row(
                                            children: [
                                              Icon(Icons.person_outline),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Flexible(
                                                  child: Text(
                                                '${val.value.capacity} people',
                                                style: primaryTextStyle(),
                                              ))
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )),
                    ],
                  ),
                ),
              );
            }).toList()
          ],
        ),
      ),
    );
  }
}

// class ContainerShadow extends StatelessWidget {
//   const ContainerShadow({required this.content, Key? key}) : super(key: key);

//   final String content;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 0.0),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             offset: Offset(0.0, 0.0),
//             blurRadius: 5.0,
//             spreadRadius: 1,
//           ),
//         ],
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(20),
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             // color: const Color(0xFFEFEEEE),
//             boxShadow: [
//               BoxShadow(
//                   color: Colors.white.withOpacity(0.9),
//                   offset: const Offset(6.0, 6.0),
//                   blurRadius: 6.0,
//                   spreadRadius: 8),
//               BoxShadow(
//                   color: Colors.black.withOpacity(0.1),
//                   offset: const Offset(-6.0, -6.0),
//                   blurRadius: 6.0,
//                   spreadRadius: 8),
//             ],
//           ),
//           margin: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
//           padding: const EdgeInsets.all(2.0),
//           child: Center(
//             child: Text(
//               content,
//               style: primaryTextStyle().copyWith(
//                 fontSize: 15,
//                 color: Colors.black54,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
