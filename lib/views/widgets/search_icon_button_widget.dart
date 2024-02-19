import 'package:flutter/material.dart';

class SearchIconButtonWidget extends StatelessWidget {
  const SearchIconButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.07),
          borderRadius: BorderRadius.circular(16)),
      child: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.search),
        iconSize: 28,
      ),
    );
  }
}
