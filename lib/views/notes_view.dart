import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/get_note_cubit/get_note_cubit.dart';
import 'package:notes_app/views/widgets/add_note_bottom_sheet.dart';
import 'package:notes_app/views/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetNoteCubit(),
      child: SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  context: context,
                  builder: (context) {
                    return const AddNoteBottomSheet();
                  });
            },
            child: const Icon(Icons.add),
          ),
          body: BlocBuilder<GetNoteCubit, GetNoteState>(
            builder: (context, state) {
              GetNoteCubit().getAllNotes();
              return const NotesViewBody();
            },
          ),
        ),
      ),
    );
  }
}
