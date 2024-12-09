// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SessionEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() answerOnTap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? answerOnTap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? answerOnTap,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AnswerOnTap value) answerOnTap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AnswerOnTap value)? answerOnTap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AnswerOnTap value)? answerOnTap,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionEventCopyWith<$Res> {
  factory $SessionEventCopyWith(
          SessionEvent value, $Res Function(SessionEvent) then) =
      _$SessionEventCopyWithImpl<$Res, SessionEvent>;
}

/// @nodoc
class _$SessionEventCopyWithImpl<$Res, $Val extends SessionEvent>
    implements $SessionEventCopyWith<$Res> {
  _$SessionEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AnswerOnTapImplCopyWith<$Res> {
  factory _$$AnswerOnTapImplCopyWith(
          _$AnswerOnTapImpl value, $Res Function(_$AnswerOnTapImpl) then) =
      __$$AnswerOnTapImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AnswerOnTapImplCopyWithImpl<$Res>
    extends _$SessionEventCopyWithImpl<$Res, _$AnswerOnTapImpl>
    implements _$$AnswerOnTapImplCopyWith<$Res> {
  __$$AnswerOnTapImplCopyWithImpl(
      _$AnswerOnTapImpl _value, $Res Function(_$AnswerOnTapImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AnswerOnTapImpl implements _AnswerOnTap {
  const _$AnswerOnTapImpl();

  @override
  String toString() {
    return 'SessionEvent.answerOnTap()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AnswerOnTapImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() answerOnTap,
  }) {
    return answerOnTap();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? answerOnTap,
  }) {
    return answerOnTap?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? answerOnTap,
    required TResult orElse(),
  }) {
    if (answerOnTap != null) {
      return answerOnTap();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AnswerOnTap value) answerOnTap,
  }) {
    return answerOnTap(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AnswerOnTap value)? answerOnTap,
  }) {
    return answerOnTap?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AnswerOnTap value)? answerOnTap,
    required TResult orElse(),
  }) {
    if (answerOnTap != null) {
      return answerOnTap(this);
    }
    return orElse();
  }
}

abstract class _AnswerOnTap implements SessionEvent {
  const factory _AnswerOnTap() = _$AnswerOnTapImpl;
}

/// @nodoc
mixin _$SessionState {
  bool get isAnswered => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SessionStateCopyWith<SessionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionStateCopyWith<$Res> {
  factory $SessionStateCopyWith(
          SessionState value, $Res Function(SessionState) then) =
      _$SessionStateCopyWithImpl<$Res, SessionState>;
  @useResult
  $Res call({bool isAnswered});
}

/// @nodoc
class _$SessionStateCopyWithImpl<$Res, $Val extends SessionState>
    implements $SessionStateCopyWith<$Res> {
  _$SessionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAnswered = null,
  }) {
    return _then(_value.copyWith(
      isAnswered: null == isAnswered
          ? _value.isAnswered
          : isAnswered // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SessionStateImplCopyWith<$Res>
    implements $SessionStateCopyWith<$Res> {
  factory _$$SessionStateImplCopyWith(
          _$SessionStateImpl value, $Res Function(_$SessionStateImpl) then) =
      __$$SessionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isAnswered});
}

/// @nodoc
class __$$SessionStateImplCopyWithImpl<$Res>
    extends _$SessionStateCopyWithImpl<$Res, _$SessionStateImpl>
    implements _$$SessionStateImplCopyWith<$Res> {
  __$$SessionStateImplCopyWithImpl(
      _$SessionStateImpl _value, $Res Function(_$SessionStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAnswered = null,
  }) {
    return _then(_$SessionStateImpl(
      isAnswered: null == isAnswered
          ? _value.isAnswered
          : isAnswered // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SessionStateImpl implements _SessionState {
  const _$SessionStateImpl({required this.isAnswered});

  @override
  final bool isAnswered;

  @override
  String toString() {
    return 'SessionState(isAnswered: $isAnswered)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionStateImpl &&
            (identical(other.isAnswered, isAnswered) ||
                other.isAnswered == isAnswered));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isAnswered);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionStateImplCopyWith<_$SessionStateImpl> get copyWith =>
      __$$SessionStateImplCopyWithImpl<_$SessionStateImpl>(this, _$identity);
}

abstract class _SessionState implements SessionState {
  const factory _SessionState({required final bool isAnswered}) =
      _$SessionStateImpl;

  @override
  bool get isAnswered;
  @override
  @JsonKey(ignore: true)
  _$$SessionStateImplCopyWith<_$SessionStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
