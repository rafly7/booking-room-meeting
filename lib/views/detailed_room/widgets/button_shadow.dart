import 'package:booking_room_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ButtonShadow extends StatefulWidget {
  const ButtonShadow({
    required this.icon,
    required this.content,
    required this.onTap,
    this.margin,
    Key? key,
  }) : super(key: key);

  final IconData icon;
  final String content;
  final Function() onTap;
  final EdgeInsets? margin;

  @override
  State<ButtonShadow> createState() => _ButtonShadowState();
}

class _ButtonShadowState extends State<ButtonShadow> {
  bool isTapButton = false;

  void handleTapButton() {
    setState(() => isTapButton = !isTapButton);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTap(),
      onTapDown: (_) {
        handleTapButton();
      },
      onTapUp: (_) {
        handleTapButton();
      },
      onTapCancel: () {
        handleTapButton();
      },
      child: _AnimatedButton(
        isTapButton: isTapButton,
        content: widget.content,
        icon: Icons.date_range,
        margin: widget.margin,
      ),
    );
  }
}

class _AnimatedButton extends StatelessWidget {
  const _AnimatedButton({
    Key? key,
    this.margin,
    required this.content,
    required this.icon,
    required this.isTapButton,
  }) : super(key: key);

  final EdgeInsets? margin;
  final String content;
  final IconData icon;
  final bool isTapButton;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.all(10.0),
      margin: margin,
      decoration: BoxDecoration(
        color: const Color(0xFFEFEEEE),
        borderRadius: BorderRadius.circular(20),
        boxShadow: isTapButton
            ? [
                BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(-2.0, -2.0),
                    blurRadius: 6.0,
                    spreadRadius: 3),
                BoxShadow(
                  color: Colors.white.withOpacity(0.9),
                  offset: const Offset(6.0, 6.0),
                  blurRadius: 6.0,
                ),
              ]
            : [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: const Offset(6.0, 6.0),
                  blurRadius: 6.0,
                ),
                BoxShadow(
                  color: Colors.white.withOpacity(0.9),
                  offset: const Offset(-6.0, -6.0),
                  blurRadius: 6.0,
                ),
              ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 10,
          ),
          Icon(
            icon,
            color: Colors.black54,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            content,
            style: primaryTextStyle().copyWith(
              color: Colors.black54,
            ),
          )
        ],
      ),
    );
  }
}
