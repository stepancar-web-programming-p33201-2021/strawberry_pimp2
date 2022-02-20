// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'wakeup_command_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WakeupCommand _$WakeupCommandFromJson(Map<String, dynamic> json) {
  return _WakeupCommand.fromJson(json);
}

/// @nodoc
class _$WakeupCommandTearOff {
  const _$WakeupCommandTearOff();

  _WakeupCommand call({required String jwt}) {
    return _WakeupCommand(
      jwt: jwt,
    );
  }

  WakeupCommand fromJson(Map<String, Object?> json) {
    return WakeupCommand.fromJson(json);
  }
}

/// @nodoc
const $WakeupCommand = _$WakeupCommandTearOff();

/// @nodoc
mixin _$WakeupCommand {
  String get jwt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WakeupCommandCopyWith<WakeupCommand> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WakeupCommandCopyWith<$Res> {
  factory $WakeupCommandCopyWith(
          WakeupCommand value, $Res Function(WakeupCommand) then) =
      _$WakeupCommandCopyWithImpl<$Res>;
  $Res call({String jwt});
}

/// @nodoc
class _$WakeupCommandCopyWithImpl<$Res>
    implements $WakeupCommandCopyWith<$Res> {
  _$WakeupCommandCopyWithImpl(this._value, this._then);

  final WakeupCommand _value;
  // ignore: unused_field
  final $Res Function(WakeupCommand) _then;

  @override
  $Res call({
    Object? jwt = freezed,
  }) {
    return _then(_value.copyWith(
      jwt: jwt == freezed
          ? _value.jwt
          : jwt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$WakeupCommandCopyWith<$Res>
    implements $WakeupCommandCopyWith<$Res> {
  factory _$WakeupCommandCopyWith(
          _WakeupCommand value, $Res Function(_WakeupCommand) then) =
      __$WakeupCommandCopyWithImpl<$Res>;
  @override
  $Res call({String jwt});
}

/// @nodoc
class __$WakeupCommandCopyWithImpl<$Res>
    extends _$WakeupCommandCopyWithImpl<$Res>
    implements _$WakeupCommandCopyWith<$Res> {
  __$WakeupCommandCopyWithImpl(
      _WakeupCommand _value, $Res Function(_WakeupCommand) _then)
      : super(_value, (v) => _then(v as _WakeupCommand));

  @override
  _WakeupCommand get _value => super._value as _WakeupCommand;

  @override
  $Res call({
    Object? jwt = freezed,
  }) {
    return _then(_WakeupCommand(
      jwt: jwt == freezed
          ? _value.jwt
          : jwt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_WakeupCommand with DiagnosticableTreeMixin implements _WakeupCommand {
  const _$_WakeupCommand({required this.jwt});

  factory _$_WakeupCommand.fromJson(Map<String, dynamic> json) =>
      _$$_WakeupCommandFromJson(json);

  @override
  final String jwt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WakeupCommand(jwt: $jwt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WakeupCommand'))
      ..add(DiagnosticsProperty('jwt', jwt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WakeupCommand &&
            const DeepCollectionEquality().equals(other.jwt, jwt));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(jwt));

  @JsonKey(ignore: true)
  @override
  _$WakeupCommandCopyWith<_WakeupCommand> get copyWith =>
      __$WakeupCommandCopyWithImpl<_WakeupCommand>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WakeupCommandToJson(this);
  }
}

abstract class _WakeupCommand implements WakeupCommand {
  const factory _WakeupCommand({required String jwt}) = _$_WakeupCommand;

  factory _WakeupCommand.fromJson(Map<String, dynamic> json) =
      _$_WakeupCommand.fromJson;

  @override
  String get jwt;
  @override
  @JsonKey(ignore: true)
  _$WakeupCommandCopyWith<_WakeupCommand> get copyWith =>
      throw _privateConstructorUsedError;
}
