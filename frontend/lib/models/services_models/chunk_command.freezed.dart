// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chunk_command.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChunkCommand _$ChunkCommandFromJson(Map<String, dynamic> json) {
  return _ChunkCommand.fromJson(json);
}

/// @nodoc
class _$ChunkCommandTearOff {
  const _$ChunkCommandTearOff();

  _ChunkCommand call({String? key, String? answer}) {
    return _ChunkCommand(
      key: key,
      answer: answer,
    );
  }

  ChunkCommand fromJson(Map<String, Object?> json) {
    return ChunkCommand.fromJson(json);
  }
}

/// @nodoc
const $ChunkCommand = _$ChunkCommandTearOff();

/// @nodoc
mixin _$ChunkCommand {
  String? get key => throw _privateConstructorUsedError;
  String? get answer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChunkCommandCopyWith<ChunkCommand> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChunkCommandCopyWith<$Res> {
  factory $ChunkCommandCopyWith(
          ChunkCommand value, $Res Function(ChunkCommand) then) =
      _$ChunkCommandCopyWithImpl<$Res>;
  $Res call({String? key, String? answer});
}

/// @nodoc
class _$ChunkCommandCopyWithImpl<$Res> implements $ChunkCommandCopyWith<$Res> {
  _$ChunkCommandCopyWithImpl(this._value, this._then);

  final ChunkCommand _value;
  // ignore: unused_field
  final $Res Function(ChunkCommand) _then;

  @override
  $Res call({
    Object? key = freezed,
    Object? answer = freezed,
  }) {
    return _then(_value.copyWith(
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
      answer: answer == freezed
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$ChunkCommandCopyWith<$Res>
    implements $ChunkCommandCopyWith<$Res> {
  factory _$ChunkCommandCopyWith(
          _ChunkCommand value, $Res Function(_ChunkCommand) then) =
      __$ChunkCommandCopyWithImpl<$Res>;
  @override
  $Res call({String? key, String? answer});
}

/// @nodoc
class __$ChunkCommandCopyWithImpl<$Res> extends _$ChunkCommandCopyWithImpl<$Res>
    implements _$ChunkCommandCopyWith<$Res> {
  __$ChunkCommandCopyWithImpl(
      _ChunkCommand _value, $Res Function(_ChunkCommand) _then)
      : super(_value, (v) => _then(v as _ChunkCommand));

  @override
  _ChunkCommand get _value => super._value as _ChunkCommand;

  @override
  $Res call({
    Object? key = freezed,
    Object? answer = freezed,
  }) {
    return _then(_ChunkCommand(
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
      answer: answer == freezed
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_ChunkCommand with DiagnosticableTreeMixin implements _ChunkCommand {
  const _$_ChunkCommand({this.key, this.answer});

  factory _$_ChunkCommand.fromJson(Map<String, dynamic> json) =>
      _$$_ChunkCommandFromJson(json);

  @override
  final String? key;
  @override
  final String? answer;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChunkCommand(key: $key, answer: $answer)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChunkCommand'))
      ..add(DiagnosticsProperty('key', key))
      ..add(DiagnosticsProperty('answer', answer));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChunkCommand &&
            const DeepCollectionEquality().equals(other.key, key) &&
            const DeepCollectionEquality().equals(other.answer, answer));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(key),
      const DeepCollectionEquality().hash(answer));

  @JsonKey(ignore: true)
  @override
  _$ChunkCommandCopyWith<_ChunkCommand> get copyWith =>
      __$ChunkCommandCopyWithImpl<_ChunkCommand>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChunkCommandToJson(this);
  }
}

abstract class _ChunkCommand implements ChunkCommand {
  const factory _ChunkCommand({String? key, String? answer}) = _$_ChunkCommand;

  factory _ChunkCommand.fromJson(Map<String, dynamic> json) =
      _$_ChunkCommand.fromJson;

  @override
  String? get key;
  @override
  String? get answer;
  @override
  @JsonKey(ignore: true)
  _$ChunkCommandCopyWith<_ChunkCommand> get copyWith =>
      throw _privateConstructorUsedError;
}
