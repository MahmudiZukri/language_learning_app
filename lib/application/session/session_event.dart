part of 'session_bloc.dart';

@freezed
class SessionEvent with _$SessionEvent {
  const factory SessionEvent.answerOnTap() = _AnswerOnTap;
}
