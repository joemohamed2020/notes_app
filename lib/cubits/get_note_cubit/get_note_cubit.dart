import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';

part 'get_note_state.dart';

class GetNoteCubit extends Cubit<GetNoteState> {
  GetNoteCubit() : super(GetNoteInitial());
  getAllNotes() {
    try {
      var box = Hive.box<NoteModel>(kNotesBox);
      List<NoteModel> notes = box.values.toList();
      emit(GetNoteSuccess(list: notes));
    } catch (e) {
      emit(GetNoteFailure(errMessage: e.toString()));
    }
  }
}
