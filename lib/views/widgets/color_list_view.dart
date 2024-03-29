import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/views/widgets/color_ball.dart';



class ColorListView extends StatefulWidget {
  const ColorListView({super.key});
  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  late int pickedBall;
  @override
  void initState() {
    super.initState();
    pickedBall = 0;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 76,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return ColorBall(
            onTap: () {
              pickedBall = index;
              BlocProvider.of<AddNoteCubit>(context).color =
                  kColors[pickedBall];
              setState(() {});
            },
            color: kColors[index],
            isPicked: pickedBall == index,
          );
        },
      ),
    );
  }
}
