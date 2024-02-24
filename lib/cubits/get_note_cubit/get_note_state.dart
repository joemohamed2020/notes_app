part of 'get_note_cubit.dart';

@immutable
abstract class GetNoteState {}

final class GetNoteInitial extends GetNoteState {}
final class GetNoteLoading extends GetNoteState{}
final class GetNoteSuccess extends GetNoteState{}
final class GetNoteFailure extends GetNoteState{
  final String errMessage;

  GetNoteFailure({required this.errMessage});
}

