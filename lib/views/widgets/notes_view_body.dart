import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/get_note_cubit/get_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/custom_text_field_widget.dart';
import 'package:notes_app/views/widgets/note_list_view.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  late bool isSearching;
  @override
  void initState() {
    isSearching = false;
    BlocProvider.of<GetNoteCubit>(context).getAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          CustomAppBar(
            title: "Notes",
            icon: Icons.search,
            onPressed: () {
              if (isSearching) {
                isSearching = false;
                BlocProvider.of<GetNoteCubit>(context).getAllNotes();
              } else {
                isSearching = true;
              }
              setState(() {});
            },
          ),
          if (isSearching) const SizedBox(height: 16),
          if (isSearching)
            CustomTextFormField(
              text: "Title",
              onChanged: (value) {
                BlocProvider.of<GetNoteCubit>(context)
                    .searchNotes(value.toString());
              },
            ),
          const SizedBox(height: 16),
          const NoteListView(),
        ],
      ),
    );
  }
}
