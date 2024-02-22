import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key,required this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: 54,
        decoration: BoxDecoration(
            color: kPrimaryColor, borderRadius: BorderRadius.circular(12)),
        child: const Text(
          "Add",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
    );
  }
}
