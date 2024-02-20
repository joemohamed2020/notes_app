import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/note_card.dart';

class NoteListView extends StatelessWidget {
  const NoteListView({super.key, required this.list});
  final List<NoteModel> list;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: NoteCard(
                noteModel: list[index],
              ),
            );
          }),
    );
  }
}
