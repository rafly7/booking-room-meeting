import 'package:flutter/material.dart';

class IconButtonShadow extends StatefulWidget {
  const IconButtonShadow({required this.onTap, Key? key}) : super(key: key);

  final Function() onTap;

  @override
  State<IconButtonShadow> createState() => _IconButtonShadowState();
}

class _IconButtonShadowState extends State<IconButtonShadow> {
  bool isTapButton = false;

  void handleTapButton() {
    setState(() => isTapButton = !isTapButton);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) {
        handleTapButton();
      },
      onTapUp: (_) {
        handleTapButton();
      },
      onTapCancel: () {
        handleTapButton();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(13.0),
        decoration: BoxDecoration(
          color: const Color(0xFFEFEEEE),
          shape: BoxShape.circle,
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
        child: Icon(Icons.edit, color: Colors.black87),
      ),
    );
  }
}
