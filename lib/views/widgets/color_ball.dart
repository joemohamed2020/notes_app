import 'package:flutter/material.dart';

class ColorBall extends StatelessWidget {
  const ColorBall(
      {super.key, required this.color, this.onTap, required this.isPicked});
  final Color color;
  final void Function()? onTap;
  final bool isPicked;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Container(
          height: 76,
          width: 76,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(32)),
          child: isPicked ? const Icon(Icons.check) : null,
        ),
      ),
    );
  }
}