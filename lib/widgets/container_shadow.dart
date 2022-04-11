import 'package:booking_room_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ContainerShadow extends StatelessWidget {
  const ContainerShadow({required this.content, Key? key}) : super(key: key);

  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 0.0),
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
            // color: const Color(0xFFEFEEEE),
            boxShadow: [
              BoxShadow(
                  color: Colors.white.withOpacity(0.9),
                  offset: const Offset(6.0, 6.0),
                  blurRadius: 6.0,
                  spreadRadius: 8),
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: const Offset(-6.0, -6.0),
                  blurRadius: 6.0,
                  spreadRadius: 8),
            ],
          ),
          margin: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
          padding: const EdgeInsets.all(2.0),
          child: Center(
            child: Text(
              content,
              style: primaryTextStyle().copyWith(
                fontSize: 15,
                color: Colors.black54,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
