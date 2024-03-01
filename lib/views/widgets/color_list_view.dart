import 'package:flutter/material.dart';

class ColorBall extends StatelessWidget {
  const ColorBall({
    super.key,
    required this.color,
    this.onTap,
    this.isPicked = false,
  });
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
          height: 38,
          width: 38,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(32)),
          child: isPicked ? const Icon(Icons.check) : null,
        ),
      ),
    );
  }
}

class ColorListView extends StatelessWidget {
  const ColorListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const ColorBall(color: Colors.blue);
        },
      ),
    );
  }
}
