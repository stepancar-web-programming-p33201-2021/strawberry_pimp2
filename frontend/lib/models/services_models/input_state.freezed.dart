// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'input_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

InputState _$InputStateFromJson(Map<String, dynamic> json) {
  return _InputState.fromJson(json);
}

/// @nodoc
class _$InputStateTearOff {
  const _$InputStateTearOff();

  _InputState call(
      {AttachmentModel? textAttach, List<AttachmentModel> other = const []}) {
    return _InputState(
      textAttach: textAttach,
      other: other,
    );
  }

  InputState fromJson(Map<String, Object?> json) {
    return InputState.fromJson(json);
  }
}

/// @nodoc
const $InputState = _$InputStateTearOff();

/// @nodoc
mixin _$InputState {
  AttachmentModel? get textAttach => throw _privateConstructorUsedError;
  List<AttachmentModel> get other => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InputStateCopyWith<InputState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InputStateCopyWith<$Res> {
  factory $InputStateCopyWith(
          InputState value, $Res Function(InputState) then) =
      _$InputStateCopyWithImpl<$Res>;
  $Res call({AttachmentModel? textAttach, List<AttachmentModel> other});

  $AttachmentModelCopyWith<$Res>? get textAttach;
}

/// @nodoc
class _$InputStateCopyWithImpl<$Res> implements $InputStateCopyWith<$Res> {
  _$InputStateCopyWithImpl(this._value, this._then);

  final InputState _value;
  // ignore: unused_field
  final $Res Function(InputState) _then;

  @override
  $Res call({
    Object? textAttach = freezed,
    Object? other = freezed,
  }) {
    return _then(_value.copyWith(
      textAttach: textAttach == freezed
          ? _value.textAttach
          : textAttach // ignore: cast_nullable_to_non_nullable
              as AttachmentModel?,
      other: other == freezed
          ? _value.other
          : other // ignore: cast_nullable_to_non_nullable
              as List<AttachmentModel>,
    ));
  }

  @override
  $AttachmentModelCopyWith<$Res>? get textAttach {
    if (_value.textAttach == null) {
      return null;
    }

    return $AttachmentModelCopyWith<$Res>(_value.textAttach!, (value) {
      return _then(_value.copyWith(textAttach: value));
    });
  }
}

/// @nodoc
abstract class _$InputStateCopyWith<$Res> implements $InputStateCopyWith<$Res> {
  factory _$InputStateCopyWith(
          _InputState value, $Res Function(_InputState) then) =
      __$InputStateCopyWithImpl<$Res>;
  @override
  $Res call({AttachmentModel? textAttach, List<AttachmentModel> other});

  @override
  $AttachmentModelCopyWith<$Res>? get textAttach;
}

/// @nodoc
class __$InputStateCopyWithImpl<$Res> extends _$InputStateCopyWithImpl<$Res>
    implements _$InputStateCopyWith<$Res> {
  __$InputStateCopyWithImpl(
      _InputState _value, $Res Function(_InputState) _then)
      : super(_value, (v) => _then(v as _InputState));

  @override
  _InputState get _value => super._value as _InputState;

  @override
  $Res call({
    Object? textAttach = freezed,
    Object? other = freezed,
  }) {
    return _then(_InputState(
      textAttach: textAttach == freezed
          ? _value.textAttach
          : textAttach // ignore: cast_nullable_to_non_nullable
              as AttachmentModel?,
      other: other == freezed
          ? _value.other
          : other // ignore: cast_nullable_to_non_nullable
              as List<AttachmentModel>,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_InputState extends _InputState with DiagnosticableTreeMixin {
  const _$_InputState({this.textAttach, this.other = const []}) : super._();

  factory _$_InputState.fromJson(Map<String, dynamic> json) =>
      _$$_InputStateFromJson(json);

  @override
  final AttachmentModel? textAttach;
  @JsonKey()
  @override
  final List<AttachmentModel> other;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'InputState(textAttach: $textAttach, other: $other)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'InputState'))
      ..add(DiagnosticsProperty('textAttach', textAttach))
      ..add(DiagnosticsProperty('other', other));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InputState &&
            const DeepCollectionEquality()
                .equals(other.textAttach, textAttach) &&
            const DeepCollectionEquality().equals(other.other, this.other));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(textAttach),
      const DeepCollectionEquality().hash(other));

  @JsonKey(ignore: true)
  @override
  _$InputStateCopyWith<_InputState> get copyWith =>
      __$InputStateCopyWithImpl<_InputState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InputStateToJson(this);
  }
}

abstract class _InputState extends InputState {
  const factory _InputState(
      {AttachmentModel? textAttach,
      List<AttachmentModel> other}) = _$_InputState;
  const _InputState._() : super._();

  factory _InputState.fromJson(Map<String, dynamic> json) =
      _$_InputState.fromJson;

  @override
  AttachmentModel? get textAttach;
  @override
  List<AttachmentModel> get other;
  @override
  @JsonKey(ignore: true)
  _$InputStateCopyWith<_InputState> get copyWith =>
      throw _privateConstructorUsedError;
}
