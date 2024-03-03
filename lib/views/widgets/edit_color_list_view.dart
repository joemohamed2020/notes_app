import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/color_ball.dart';

class EditColorListView extends StatefulWidget {
  const EditColorListView({super.key, required this.noteModel});
  final NoteModel noteModel;
  @override
  State<EditColorListView> createState() => _EditColorListViewState();
}

class _EditColorListViewState extends State<EditColorListView> {
  late int pickedBall;
  @override
  void initState() {
    super.initState();
    pickedBall = kColors.indexOf(Color(widget.noteModel.color));
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
              widget.noteModel.color = kColors[pickedBall].value;
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
