// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatModel _$ChatModelFromJson(Map<String, dynamic> json) {
  return _ChatModel.fromJson(json);
}

/// @nodoc
class _$ChatModelTearOff {
  const _$ChatModelTearOff();

  _ChatModel call(
      {String? id,
      UserModel? userA,
      UserModel? userB,
      String? createdAt,
      String? messagesListId,
      String? lastMessage}) {
    return _ChatModel(
      id: id,
      userA: userA,
      userB: userB,
      createdAt: createdAt,
      messagesListId: messagesListId,
      lastMessage: lastMessage,
    );
  }

  ChatModel fromJson(Map<String, Object?> json) {
    return ChatModel.fromJson(json);
  }
}

/// @nodoc
const $ChatModel = _$ChatModelTearOff();

/// @nodoc
mixin _$ChatModel {
  String? get id => throw _privateConstructorUsedError;
  UserModel? get userA => throw _privateConstructorUsedError;
  UserModel? get userB => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get messagesListId => throw _privateConstructorUsedError;
  String? get lastMessage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatModelCopyWith<ChatModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatModelCopyWith<$Res> {
  factory $ChatModelCopyWith(ChatModel value, $Res Function(ChatModel) then) =
      _$ChatModelCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      UserModel? userA,
      UserModel? userB,
      String? createdAt,
      String? messagesListId,
      String? lastMessage});

  $UserModelCopyWith<$Res>? get userA;
  $UserModelCopyWith<$Res>? get userB;
}

/// @nodoc
class _$ChatModelCopyWithImpl<$Res> implements $ChatModelCopyWith<$Res> {
  _$ChatModelCopyWithImpl(this._value, this._then);

  final ChatModel _value;
  // ignore: unused_field
  final $Res Function(ChatModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? userA = freezed,
    Object? userB = freezed,
    Object? createdAt = freezed,
    Object? messagesListId = freezed,
    Object? lastMessage = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userA: userA == freezed
          ? _value.userA
          : userA // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      userB: userB == freezed
          ? _value.userB
          : userB // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      messagesListId: messagesListId == freezed
          ? _value.messagesListId
          : messagesListId // ignore: cast_nullable_to_non_nullable
              as String?,
      lastMessage: lastMessage == freezed
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $UserModelCopyWith<$Res>? get userA {
    if (_value.userA == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.userA!, (value) {
      return _then(_value.copyWith(userA: value));
    });
  }

  @override
  $UserModelCopyWith<$Res>? get userB {
    if (_value.userB == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.userB!, (value) {
      return _then(_value.copyWith(userB: value));
    });
  }
}

/// @nodoc
abstract class _$ChatModelCopyWith<$Res> implements $ChatModelCopyWith<$Res> {
  factory _$ChatModelCopyWith(
          _ChatModel value, $Res Function(_ChatModel) then) =
      __$ChatModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      UserModel? userA,
      UserModel? userB,
      String? createdAt,
      String? messagesListId,
      String? lastMessage});

  @override
  $UserModelCopyWith<$Res>? get userA;
  @override
  $UserModelCopyWith<$Res>? get userB;
}

/// @nodoc
class __$ChatModelCopyWithImpl<$Res> extends _$ChatModelCopyWithImpl<$Res>
    implements _$ChatModelCopyWith<$Res> {
  __$ChatModelCopyWithImpl(_ChatModel _value, $Res Function(_ChatModel) _then)
      : super(_value, (v) => _then(v as _ChatModel));

  @override
  _ChatModel get _value => super._value as _ChatModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? userA = freezed,
    Object? userB = freezed,
    Object? createdAt = freezed,
    Object? messagesListId = freezed,
    Object? lastMessage = freezed,
  }) {
    return _then(_ChatModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userA: userA == freezed
          ? _value.userA
          : userA // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      userB: userB == freezed
          ? _value.userB
          : userB // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      messagesListId: messagesListId == freezed
          ? _value.messagesListId
          : messagesListId // ignore: cast_nullable_to_non_nullable
              as String?,
      lastMessage: lastMessage == freezed
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_ChatModel with DiagnosticableTreeMixin implements _ChatModel {
  const _$_ChatModel(
      {this.id,
      this.userA,
      this.userB,
      this.createdAt,
      this.messagesListId,
      this.lastMessage});

  factory _$_ChatModel.fromJson(Map<String, dynamic> json) =>
      _$$_ChatModelFromJson(json);

  @override
  final String? id;
  @override
  final UserModel? userA;
  @override
  final UserModel? userB;
  @override
  final String? createdAt;
  @override
  final String? messagesListId;
  @override
  final String? lastMessage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChatModel(id: $id, userA: $userA, userB: $userB, createdAt: $createdAt, messagesListId: $messagesListId, lastMessage: $lastMessage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChatModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('userA', userA))
      ..add(DiagnosticsProperty('userB', userB))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('messagesListId', messagesListId))
      ..add(DiagnosticsProperty('lastMessage', lastMessage));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.userA, userA) &&
            const DeepCollectionEquality().equals(other.userB, userB) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality()
                .equals(other.messagesListId, messagesListId) &&
            const DeepCollectionEquality()
                .equals(other.lastMessage, lastMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(userA),
      const DeepCollectionEquality().hash(userB),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(messagesListId),
      const DeepCollectionEquality().hash(lastMessage));

  @JsonKey(ignore: true)
  @override
  _$ChatModelCopyWith<_ChatModel> get copyWith =>
      __$ChatModelCopyWithImpl<_ChatModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatModelToJson(this);
  }
}

abstract class _ChatModel implements ChatModel {
  const factory _ChatModel(
      {String? id,
      UserModel? userA,
      UserModel? userB,
      String? createdAt,
      String? messagesListId,
      String? lastMessage}) = _$_ChatModel;

  factory _ChatModel.fromJson(Map<String, dynamic> json) =
      _$_ChatModel.fromJson;

  @override
  String? get id;
  @override
  UserModel? get userA;
  @override
  UserModel? get userB;
  @override
  String? get createdAt;
  @override
  String? get messagesListId;
  @override
  String? get lastMessage;
  @override
  @JsonKey(ignore: true)
  _$ChatModelCopyWith<_ChatModel> get copyWith =>
      throw _privateConstructorUsedError;
}
