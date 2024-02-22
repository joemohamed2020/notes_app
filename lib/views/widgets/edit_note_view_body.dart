import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/custom_text_field_widget.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          CustomAppBar(
            title: "Edit Note",
            icon: Icons.check,
          ),
          SizedBox(height: 32),
          CustomTextFormField(text: "Title"),
          SizedBox(height: 16),
          CustomTextFormField(text: "Content", maxLines: 5),
        ],
      ),
    );
  }
}
