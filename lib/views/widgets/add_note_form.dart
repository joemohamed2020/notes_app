import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/color_list_view.dart';
import 'package:notes_app/views/widgets/custom_button.dart';
import 'package:notes_app/views/widgets/custom_text_field_widget.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });
  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  Color color = Colors.orange;
  late final List<Color> colors;
  bool isPicked = false;
  @override
  void initState() {
    colors = [
      Colors.orange,
      Colors.red,
      Colors.blue,
      Colors.yellow,
      Colors.green,
      Colors.cyan,
      Colors.brown,
      Colors.amber,
      Colors.indigo,
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CustomTextFormField(
          text: 'Title',
          onSaved: (value) {
            title = value;
          },
        ),
        const SizedBox(
          height: 16,
        ),
        CustomTextFormField(
          text: "Content",
          maxLines: 6,
          onSaved: (value) {
            subTitle = value;
          },
        ),
        const SizedBox(
          height: 16,
        ),
        const ColorListView(),
        const SizedBox(
          height: 16,
        ),
        BlocBuilder<AddNoteCubit, AddNoteState>(
          builder: (context, state) {
            return CustomButton(
              isLoading: state is AddNoteLoading ? true : false,
              onTap: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  NoteModel noteModel = NoteModel(
                      title: title!,
                      subTitle: subTitle!,
                      date:
                          "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}",
                      color: color.value);
                  BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
            );
          },
        ),
        const SizedBox(
          height: 16,
        ),
      ]),
    );
  }
}
