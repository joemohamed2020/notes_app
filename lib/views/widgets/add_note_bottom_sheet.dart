import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_button.dart';
import 'package:notes_app/views/widgets/custom_text_field_widget.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 32.0, right: 16, left: 16),
      child: SingleChildScrollView(
        child: Column(children: [
          CustomTextField(text: 'Title'),
          SizedBox(
            height: 16,
          ),
          CustomTextField(
            text: "Content",
            maxLines: 6,
          ),
          SizedBox(
            height: 64,
          ),
          CustomButton(),
          SizedBox(
            height: 16,
          ),
        ]),
      ),
    );
  }
}
