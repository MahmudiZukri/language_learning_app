import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc()
      : super(
          HomeState.initial(),
        ) {
    on<HomeEvent>(
      (event, emit) async {
        event.map(
          changeView: (e) async {
            emit(
              state.copyWith(
                isListView: !state.isListView,
              ),
            );
          },
        );
      },
    );
  }
}
