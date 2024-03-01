import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/get_note_cubit/get_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.noteModel});
  final NoteModel noteModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return EditNoteView(
            noteModel: noteModel,
          );
        }));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Color(noteModel.color),
            borderRadius: const BorderRadius.all(Radius.circular(16))),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, top: 24, bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Text(
                  noteModel.title,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    noteModel.subTitle,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ),
                trailing: IconButton(
                  padding: const EdgeInsets.only(left: 16),
                  onPressed: () {
                    noteModel.delete();
                    BlocProvider.of<GetNoteCubit>(context).getAllNotes();
                  },
                  icon: const Icon(Icons.delete),
                  color: Colors.black,
                  iconSize: 32,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16.0, top: 24),
                child: Text(
                  noteModel.date,
                  style: const TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
