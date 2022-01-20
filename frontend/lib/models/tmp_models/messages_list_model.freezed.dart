// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'messages_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MessagesList _$MessagesListFromJson(Map<String, dynamic> json) {
  return _MessagesList.fromJson(json);
}

/// @nodoc
class _$MessagesListTearOff {
  const _$MessagesListTearOff();

  _MessagesList call({String? id, List<MessageModel>? messages}) {
    return _MessagesList(
      id: id,
      messages: messages,
    );
  }

  MessagesList fromJson(Map<String, Object?> json) {
    return MessagesList.fromJson(json);
  }
}

/// @nodoc
const $MessagesList = _$MessagesListTearOff();

/// @nodoc
mixin _$MessagesList {
  String? get id => throw _privateConstructorUsedError;
  List<MessageModel>? get messages => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessagesListCopyWith<MessagesList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessagesListCopyWith<$Res> {
  factory $MessagesListCopyWith(
          MessagesList value, $Res Function(MessagesList) then) =
      _$MessagesListCopyWithImpl<$Res>;
  $Res call({String? id, List<MessageModel>? messages});
}

/// @nodoc
class _$MessagesListCopyWithImpl<$Res> implements $MessagesListCopyWith<$Res> {
  _$MessagesListCopyWithImpl(this._value, this._then);

  final MessagesList _value;
  // ignore: unused_field
  final $Res Function(MessagesList) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? messages = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      messages: messages == freezed
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<MessageModel>?,
    ));
  }
}

/// @nodoc
abstract class _$MessagesListCopyWith<$Res>
    implements $MessagesListCopyWith<$Res> {
  factory _$MessagesListCopyWith(
          _MessagesList value, $Res Function(_MessagesList) then) =
      __$MessagesListCopyWithImpl<$Res>;
  @override
  $Res call({String? id, List<MessageModel>? messages});
}

/// @nodoc
class __$MessagesListCopyWithImpl<$Res> extends _$MessagesListCopyWithImpl<$Res>
    implements _$MessagesListCopyWith<$Res> {
  __$MessagesListCopyWithImpl(
      _MessagesList _value, $Res Function(_MessagesList) _then)
      : super(_value, (v) => _then(v as _MessagesList));

  @override
  _MessagesList get _value => super._value as _MessagesList;

  @override
  $Res call({
    Object? id = freezed,
    Object? messages = freezed,
  }) {
    return _then(_MessagesList(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      messages: messages == freezed
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<MessageModel>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_MessagesList with DiagnosticableTreeMixin implements _MessagesList {
  const _$_MessagesList({this.id, this.messages});

  factory _$_MessagesList.fromJson(Map<String, dynamic> json) =>
      _$$_MessagesListFromJson(json);

  @override
  final String? id;
  @override
  final List<MessageModel>? messages;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MessagesList(id: $id, messages: $messages)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MessagesList'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('messages', messages));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MessagesList &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.messages, messages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(messages));

  @JsonKey(ignore: true)
  @override
  _$MessagesListCopyWith<_MessagesList> get copyWith =>
      __$MessagesListCopyWithImpl<_MessagesList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MessagesListToJson(this);
  }
}

abstract class _MessagesList implements MessagesList {
  const factory _MessagesList({String? id, List<MessageModel>? messages}) =
      _$_MessagesList;

  factory _MessagesList.fromJson(Map<String, dynamic> json) =
      _$_MessagesList.fromJson;

  @override
  String? get id;
  @override
  List<MessageModel>? get messages;
  @override
  @JsonKey(ignore: true)
  _$MessagesListCopyWith<_MessagesList> get copyWith =>
      throw _privateConstructorUsedError;
}
