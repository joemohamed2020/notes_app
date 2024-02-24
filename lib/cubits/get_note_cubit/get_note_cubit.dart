import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'get_note_state.dart';

class GetNoteCubit extends Cubit<GetNoteState> {
  GetNoteCubit() : super(GetNoteInitial());
  getAllNotes() {
    
  }
}
