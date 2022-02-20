// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'subscribe_command_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SubscribeCommand _$SubscribeCommandFromJson(Map<String, dynamic> json) {
  return _SubscribeCommand.fromJson(json);
}

/// @nodoc
class _$SubscribeCommandTearOff {
  const _$SubscribeCommandTearOff();

  _SubscribeCommand call(
      {required String method,
      required String token,
      String? params,
      required int timeout}) {
    return _SubscribeCommand(
      method: method,
      token: token,
      params: params,
      timeout: timeout,
    );
  }

  SubscribeCommand fromJson(Map<String, Object?> json) {
    return SubscribeCommand.fromJson(json);
  }
}

/// @nodoc
const $SubscribeCommand = _$SubscribeCommandTearOff();

/// @nodoc
mixin _$SubscribeCommand {
  String get method => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;
  String? get params => throw _privateConstructorUsedError;
  int get timeout => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubscribeCommandCopyWith<SubscribeCommand> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscribeCommandCopyWith<$Res> {
  factory $SubscribeCommandCopyWith(
          SubscribeCommand value, $Res Function(SubscribeCommand) then) =
      _$SubscribeCommandCopyWithImpl<$Res>;
  $Res call({String method, String token, String? params, int timeout});
}

/// @nodoc
class _$SubscribeCommandCopyWithImpl<$Res>
    implements $SubscribeCommandCopyWith<$Res> {
  _$SubscribeCommandCopyWithImpl(this._value, this._then);

  final SubscribeCommand _value;
  // ignore: unused_field
  final $Res Function(SubscribeCommand) _then;

  @override
  $Res call({
    Object? method = freezed,
    Object? token = freezed,
    Object? params = freezed,
    Object? timeout = freezed,
  }) {
    return _then(_value.copyWith(
      method: method == freezed
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      params: params == freezed
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as String?,
      timeout: timeout == freezed
          ? _value.timeout
          : timeout // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$SubscribeCommandCopyWith<$Res>
    implements $SubscribeCommandCopyWith<$Res> {
  factory _$SubscribeCommandCopyWith(
          _SubscribeCommand value, $Res Function(_SubscribeCommand) then) =
      __$SubscribeCommandCopyWithImpl<$Res>;
  @override
  $Res call({String method, String token, String? params, int timeout});
}

/// @nodoc
class __$SubscribeCommandCopyWithImpl<$Res>
    extends _$SubscribeCommandCopyWithImpl<$Res>
    implements _$SubscribeCommandCopyWith<$Res> {
  __$SubscribeCommandCopyWithImpl(
      _SubscribeCommand _value, $Res Function(_SubscribeCommand) _then)
      : super(_value, (v) => _then(v as _SubscribeCommand));

  @override
  _SubscribeCommand get _value => super._value as _SubscribeCommand;

  @override
  $Res call({
    Object? method = freezed,
    Object? token = freezed,
    Object? params = freezed,
    Object? timeout = freezed,
  }) {
    return _then(_SubscribeCommand(
      method: method == freezed
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      params: params == freezed
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as String?,
      timeout: timeout == freezed
          ? _value.timeout
          : timeout // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_SubscribeCommand
    with DiagnosticableTreeMixin
    implements _SubscribeCommand {
  const _$_SubscribeCommand(
      {required this.method,
      required this.token,
      this.params,
      required this.timeout});

  factory _$_SubscribeCommand.fromJson(Map<String, dynamic> json) =>
      _$$_SubscribeCommandFromJson(json);

  @override
  final String method;
  @override
  final String token;
  @override
  final String? params;
  @override
  final int timeout;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SubscribeCommand(method: $method, token: $token, params: $params, timeout: $timeout)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SubscribeCommand'))
      ..add(DiagnosticsProperty('method', method))
      ..add(DiagnosticsProperty('token', token))
      ..add(DiagnosticsProperty('params', params))
      ..add(DiagnosticsProperty('timeout', timeout));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SubscribeCommand &&
            const DeepCollectionEquality().equals(other.method, method) &&
            const DeepCollectionEquality().equals(other.token, token) &&
            const DeepCollectionEquality().equals(other.params, params) &&
            const DeepCollectionEquality().equals(other.timeout, timeout));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(method),
      const DeepCollectionEquality().hash(token),
      const DeepCollectionEquality().hash(params),
      const DeepCollectionEquality().hash(timeout));

  @JsonKey(ignore: true)
  @override
  _$SubscribeCommandCopyWith<_SubscribeCommand> get copyWith =>
      __$SubscribeCommandCopyWithImpl<_SubscribeCommand>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SubscribeCommandToJson(this);
  }
}

abstract class _SubscribeCommand implements SubscribeCommand {
  const factory _SubscribeCommand(
      {required String method,
      required String token,
      String? params,
      required int timeout}) = _$_SubscribeCommand;

  factory _SubscribeCommand.fromJson(Map<String, dynamic> json) =
      _$_SubscribeCommand.fromJson;

  @override
  String get method;
  @override
  String get token;
  @override
  String? get params;
  @override
  int get timeout;
  @override
  @JsonKey(ignore: true)
  _$SubscribeCommandCopyWith<_SubscribeCommand> get copyWith =>
      throw _privateConstructorUsedError;
}
