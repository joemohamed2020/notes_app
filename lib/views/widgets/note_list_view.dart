import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/get_note_cubit/get_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/note_card.dart';

class NoteListView extends StatelessWidget {
  const NoteListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetNoteCubit, GetNoteState>(
      builder: (context, state) {
        List<NoteModel> notes =
            BlocProvider.of<GetNoteCubit>(context).notes ?? [];
        return Expanded(
          child: ListView.builder(
              physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: NoteCard(
                    noteModel: notes[index],
                  ),
                );
              }),
        );
      },
    );
  }
}
