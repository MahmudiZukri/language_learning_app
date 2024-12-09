part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required bool isListView,
  }) = _HomeState;

  factory HomeState.initial() => const HomeState(
        isListView: true,
      );
}
