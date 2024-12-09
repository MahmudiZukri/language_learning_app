import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_event.dart';
part 'session_state.dart';
part 'session_bloc.freezed.dart';

@injectable
class SessionBloc extends Bloc<SessionEvent, SessionState> {
  SessionBloc()
      : super(
          SessionState.initial(),
        ) {
    on<SessionEvent>(
      (event, emit) async {
        event.map(
          answerOnTap: (e) async {
            emit(
              state.copyWith(
                isAnswered: !state.isAnswered,
              ),
            );
          },
        );
      },
    );
  }
}
