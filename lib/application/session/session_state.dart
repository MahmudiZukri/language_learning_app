part of 'session_bloc.dart';

@freezed
class SessionState with _$SessionState {
  const factory SessionState({
    required bool isAnswered,
    required bool isSkipped,
    required bool isTappedPic,
  }) = _SessionState;

  factory SessionState.initial() => const SessionState(
        isAnswered: false,
        isSkipped: false,
        isTappedPic: false,
      );
}
