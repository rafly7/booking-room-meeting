import 'package:booking_room_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class TextContent extends StatelessWidget {
  const TextContent({
    this.margin,
    required this.content,
    required this.prefixField,
    this.width,
    Key? key,
  }) : super(key: key);

  final String content;
  final String prefixField;
  final EdgeInsets? margin;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: margin,
      // margin: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 0.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0.0, 0.0),
            blurRadius: 5.0,
            spreadRadius: 1,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(-2.0, -2.0),
                    blurRadius: 6.0,
                    spreadRadius: 3),
                BoxShadow(
                    color: Color(0xFFEFEEEE).withOpacity(0.9),
                    offset: const Offset(6.0, 6.0),
                    blurRadius: 6.0,
                    spreadRadius: 8),
              ],
            ),
            margin: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  prefixField,
                  style: primaryTextStyle().copyWith(
                      fontSize: 17,
                      color: Colors.black54,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  content,
                  style: primaryTextStyle().copyWith(
                    fontSize: 17,
                    color: Colors.black54,
                  ),
                ),
              ],
            )
            // Center(
            //   child: Text(
            //     content,
            //     style: primaryTextStyle().copyWith(
            //         fontSize: 17,
            //         color: Colors.black54,
            //         fontWeight: FontWeight.w600),
            //   ),
            // ),
            ),
      ),
    );
  }
}
