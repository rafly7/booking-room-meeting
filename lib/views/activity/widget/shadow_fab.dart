import 'package:flutter/material.dart';

class ShadowFAB extends StatefulWidget {
  const ShadowFAB({required this.onTap, Key? key}) : super(key: key);

  final Function() onTap;

  @override
  State<ShadowFAB> createState() => _ShadowFABState();
}

class _ShadowFABState extends State<ShadowFAB> {
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
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: isTapButton
              ? const Color(0xFF7f8C8D).withOpacity(0.3)
              : const Color(0xFF7f8C8D).withOpacity(0.5),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: isTapButton
                  ? Colors.grey.withOpacity(0.2)
                  : Colors.grey.withOpacity(0.8),
              blurRadius: 6,
              offset: const Offset(4, 4),
            ),
            const BoxShadow(
              color: Colors.white,
              blurRadius: 4,
              offset: Offset(-4, -4),
            ),
          ],
        ),
        child: const Center(
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
    );
  }
}
