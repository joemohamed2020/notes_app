import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';

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

class ColorListView extends StatefulWidget {
  const ColorListView({super.key});

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  late int pickedBall;
  late List<Color> colors;
  @override
  void initState() {
    super.initState();
    pickedBall = 0;
    colors = const [
      Color(0xffe1b07e),
      Color(0xffe5be9e),
      Color(0xffcbc0ad),
      Color(0xff86a397),
      Color(0xff361d2e),
      Color(0xff826251),
      Color(0xff68c3d4),
      Color(0xff568ea3),
      Color(0xffffe8d1),
      Color(0xffffffff)
    ];
    BlocProvider.of<AddNoteCubit>(context).color = colors[pickedBall];
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return ColorBall(
            onTap: () {
              pickedBall = index;
              BlocProvider.of<AddNoteCubit>(context).color = colors[pickedBall];
              setState(() {});
            },
            color: colors[index],
            isPicked: pickedBall == index,
          );
        },
      ),
    );
  }
}
