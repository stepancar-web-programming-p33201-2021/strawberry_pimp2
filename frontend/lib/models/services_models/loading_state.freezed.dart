// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'loading_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoadingState _$LoadingStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'loading':
      return _LoadingStateLoading.fromJson(json);
    case 'error':
      return _LoadingStateError.fromJson(json);
    case 'complete':
      return _LoadingStateComplete.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'LoadingState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
class _$LoadingStateTearOff {
  const _$LoadingStateTearOff();

  _LoadingStateLoading loading() {
    return const _LoadingStateLoading();
  }

  _LoadingStateError error(String error) {
    return _LoadingStateError(
      error,
    );
  }

  _LoadingStateComplete complete() {
    return const _LoadingStateComplete();
  }

  LoadingState fromJson(Map<String, Object?> json) {
    return LoadingState.fromJson(json);
  }
}

/// @nodoc
const $LoadingState = _$LoadingStateTearOff();

/// @nodoc
mixin _$LoadingState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function() complete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function()? complete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function()? complete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingStateLoading value) loading,
    required TResult Function(_LoadingStateError value) error,
    required TResult Function(_LoadingStateComplete value) complete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadingStateLoading value)? loading,
    TResult Function(_LoadingStateError value)? error,
    TResult Function(_LoadingStateComplete value)? complete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingStateLoading value)? loading,
    TResult Function(_LoadingStateError value)? error,
    TResult Function(_LoadingStateComplete value)? complete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoadingStateCopyWith<$Res> {
  factory $LoadingStateCopyWith(
          LoadingState value, $Res Function(LoadingState) then) =
      _$LoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadingStateCopyWithImpl<$Res> implements $LoadingStateCopyWith<$Res> {
  _$LoadingStateCopyWithImpl(this._value, this._then);

  final LoadingState _value;
  // ignore: unused_field
  final $Res Function(LoadingState) _then;
}

/// @nodoc
abstract class _$LoadingStateLoadingCopyWith<$Res> {
  factory _$LoadingStateLoadingCopyWith(_LoadingStateLoading value,
          $Res Function(_LoadingStateLoading) then) =
      __$LoadingStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingStateLoadingCopyWithImpl<$Res>
    extends _$LoadingStateCopyWithImpl<$Res>
    implements _$LoadingStateLoadingCopyWith<$Res> {
  __$LoadingStateLoadingCopyWithImpl(
      _LoadingStateLoading _value, $Res Function(_LoadingStateLoading) _then)
      : super(_value, (v) => _then(v as _LoadingStateLoading));

  @override
  _LoadingStateLoading get _value => super._value as _LoadingStateLoading;
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_LoadingStateLoading extends _LoadingStateLoading
    with DiagnosticableTreeMixin {
  const _$_LoadingStateLoading({String? $type})
      : $type = $type ?? 'loading',
        super._();

  factory _$_LoadingStateLoading.fromJson(Map<String, dynamic> json) =>
      _$$_LoadingStateLoadingFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoadingState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'LoadingState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _LoadingStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function() complete,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function()? complete,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function()? complete,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingStateLoading value) loading,
    required TResult Function(_LoadingStateError value) error,
    required TResult Function(_LoadingStateComplete value) complete,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadingStateLoading value)? loading,
    TResult Function(_LoadingStateError value)? error,
    TResult Function(_LoadingStateComplete value)? complete,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingStateLoading value)? loading,
    TResult Function(_LoadingStateError value)? error,
    TResult Function(_LoadingStateComplete value)? complete,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoadingStateLoadingToJson(this);
  }
}

abstract class _LoadingStateLoading extends LoadingState {
  const factory _LoadingStateLoading() = _$_LoadingStateLoading;
  const _LoadingStateLoading._() : super._();

  factory _LoadingStateLoading.fromJson(Map<String, dynamic> json) =
      _$_LoadingStateLoading.fromJson;
}

/// @nodoc
abstract class _$LoadingStateErrorCopyWith<$Res> {
  factory _$LoadingStateErrorCopyWith(
          _LoadingStateError value, $Res Function(_LoadingStateError) then) =
      __$LoadingStateErrorCopyWithImpl<$Res>;
  $Res call({String error});
}

/// @nodoc
class __$LoadingStateErrorCopyWithImpl<$Res>
    extends _$LoadingStateCopyWithImpl<$Res>
    implements _$LoadingStateErrorCopyWith<$Res> {
  __$LoadingStateErrorCopyWithImpl(
      _LoadingStateError _value, $Res Function(_LoadingStateError) _then)
      : super(_value, (v) => _then(v as _LoadingStateError));

  @override
  _LoadingStateError get _value => super._value as _LoadingStateError;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_LoadingStateError(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoadingStateError extends _LoadingStateError
    with DiagnosticableTreeMixin {
  const _$_LoadingStateError(this.error, {String? $type})
      : $type = $type ?? 'error',
        super._();

  factory _$_LoadingStateError.fromJson(Map<String, dynamic> json) =>
      _$$_LoadingStateErrorFromJson(json);

  @override
  final String error;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoadingState.error(error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LoadingState.error'))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoadingStateError &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$LoadingStateErrorCopyWith<_LoadingStateError> get copyWith =>
      __$LoadingStateErrorCopyWithImpl<_LoadingStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function() complete,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function()? complete,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function()? complete,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingStateLoading value) loading,
    required TResult Function(_LoadingStateError value) error,
    required TResult Function(_LoadingStateComplete value) complete,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadingStateLoading value)? loading,
    TResult Function(_LoadingStateError value)? error,
    TResult Function(_LoadingStateComplete value)? complete,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingStateLoading value)? loading,
    TResult Function(_LoadingStateError value)? error,
    TResult Function(_LoadingStateComplete value)? complete,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoadingStateErrorToJson(this);
  }
}

abstract class _LoadingStateError extends LoadingState {
  const factory _LoadingStateError(String error) = _$_LoadingStateError;
  const _LoadingStateError._() : super._();

  factory _LoadingStateError.fromJson(Map<String, dynamic> json) =
      _$_LoadingStateError.fromJson;

  String get error;
  @JsonKey(ignore: true)
  _$LoadingStateErrorCopyWith<_LoadingStateError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoadingStateCompleteCopyWith<$Res> {
  factory _$LoadingStateCompleteCopyWith(_LoadingStateComplete value,
          $Res Function(_LoadingStateComplete) then) =
      __$LoadingStateCompleteCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingStateCompleteCopyWithImpl<$Res>
    extends _$LoadingStateCopyWithImpl<$Res>
    implements _$LoadingStateCompleteCopyWith<$Res> {
  __$LoadingStateCompleteCopyWithImpl(
      _LoadingStateComplete _value, $Res Function(_LoadingStateComplete) _then)
      : super(_value, (v) => _then(v as _LoadingStateComplete));

  @override
  _LoadingStateComplete get _value => super._value as _LoadingStateComplete;
}

/// @nodoc
@JsonSerializable()
class _$_LoadingStateComplete extends _LoadingStateComplete
    with DiagnosticableTreeMixin {
  const _$_LoadingStateComplete({String? $type})
      : $type = $type ?? 'complete',
        super._();

  factory _$_LoadingStateComplete.fromJson(Map<String, dynamic> json) =>
      _$$_LoadingStateCompleteFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoadingState.complete()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'LoadingState.complete'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _LoadingStateComplete);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function() complete,
  }) {
    return complete();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function()? complete,
  }) {
    return complete?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function()? complete,
    required TResult orElse(),
  }) {
    if (complete != null) {
      return complete();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadingStateLoading value) loading,
    required TResult Function(_LoadingStateError value) error,
    required TResult Function(_LoadingStateComplete value) complete,
  }) {
    return complete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadingStateLoading value)? loading,
    TResult Function(_LoadingStateError value)? error,
    TResult Function(_LoadingStateComplete value)? complete,
  }) {
    return complete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadingStateLoading value)? loading,
    TResult Function(_LoadingStateError value)? error,
    TResult Function(_LoadingStateComplete value)? complete,
    required TResult orElse(),
  }) {
    if (complete != null) {
      return complete(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoadingStateCompleteToJson(this);
  }
}

abstract class _LoadingStateComplete extends LoadingState {
  const factory _LoadingStateComplete() = _$_LoadingStateComplete;
  const _LoadingStateComplete._() : super._();

  factory _LoadingStateComplete.fromJson(Map<String, dynamic> json) =
      _$_LoadingStateComplete.fromJson;
}
