import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/note_list_view.dart';

class NotesViewBody extends StatelessWidget {
  NotesViewBody({super.key});

  final List<NoteModel> list = [
    NoteModel(
      title: "Joe",
      subTitle: "hello Mother Fucker",
      date: "May 21, 2022",
    ),
    NoteModel(
      title: "Joe1",
      subTitle: "hello Mother Fucker1",
      date: "May 21, 20221",
    ),
    NoteModel(
      title: "Joe2",
      subTitle: "hello Mother Fucker1",
      date: "May 21, 20221",
    ),
    NoteModel(
      title: "Joe3",
      subTitle: "hello Mother Fucker1",
      date: "May 21, 20221",
    ),
    NoteModel(
      title: "Joe3",
      subTitle: "hello Mother Fucker1",
      date: "May 21, 20221",
    ),
    NoteModel(
      title: "Joe3",
      subTitle: "hello Mother Fucker1",
      date: "May 21, 20221",
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const CustomAppBar(),
          const SizedBox(height: 16),
          NoteListView(
            list: list,
          ),
        ],
      ),
    );
  }
}
