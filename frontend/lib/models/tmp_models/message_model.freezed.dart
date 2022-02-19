// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'message_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MessageModel _$MessageModelFromJson(Map<String, dynamic> json) {
  return _MessageModel.fromJson(json);
}

/// @nodoc
class _$MessageModelTearOff {
  const _$MessageModelTearOff();

  _MessageModel call(
      {String? id,
      List<AttachmentModel>? attachments,
      MessageSender? messageSender,
      String? createdAt,
      String? updatedAt,
      int? readAt}) {
    return _MessageModel(
      id: id,
      attachments: attachments,
      messageSender: messageSender,
      createdAt: createdAt,
      updatedAt: updatedAt,
      readAt: readAt,
    );
  }

  MessageModel fromJson(Map<String, Object?> json) {
    return MessageModel.fromJson(json);
  }
}

/// @nodoc
const $MessageModel = _$MessageModelTearOff();

/// @nodoc
mixin _$MessageModel {
  String? get id => throw _privateConstructorUsedError;
  List<AttachmentModel>? get attachments => throw _privateConstructorUsedError;
  MessageSender? get messageSender => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;
  int? get readAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageModelCopyWith<MessageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageModelCopyWith<$Res> {
  factory $MessageModelCopyWith(
          MessageModel value, $Res Function(MessageModel) then) =
      _$MessageModelCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      List<AttachmentModel>? attachments,
      MessageSender? messageSender,
      String? createdAt,
      String? updatedAt,
      int? readAt});
}

/// @nodoc
class _$MessageModelCopyWithImpl<$Res> implements $MessageModelCopyWith<$Res> {
  _$MessageModelCopyWithImpl(this._value, this._then);

  final MessageModel _value;
  // ignore: unused_field
  final $Res Function(MessageModel) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? attachments = freezed,
    Object? messageSender = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? readAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      attachments: attachments == freezed
          ? _value.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<AttachmentModel>?,
      messageSender: messageSender == freezed
          ? _value.messageSender
          : messageSender // ignore: cast_nullable_to_non_nullable
              as MessageSender?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      readAt: readAt == freezed
          ? _value.readAt
          : readAt // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$MessageModelCopyWith<$Res>
    implements $MessageModelCopyWith<$Res> {
  factory _$MessageModelCopyWith(
          _MessageModel value, $Res Function(_MessageModel) then) =
      __$MessageModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      List<AttachmentModel>? attachments,
      MessageSender? messageSender,
      String? createdAt,
      String? updatedAt,
      int? readAt});
}

/// @nodoc
class __$MessageModelCopyWithImpl<$Res> extends _$MessageModelCopyWithImpl<$Res>
    implements _$MessageModelCopyWith<$Res> {
  __$MessageModelCopyWithImpl(
      _MessageModel _value, $Res Function(_MessageModel) _then)
      : super(_value, (v) => _then(v as _MessageModel));

  @override
  _MessageModel get _value => super._value as _MessageModel;

  @override
  $Res call({
    Object? id = freezed,
    Object? attachments = freezed,
    Object? messageSender = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? readAt = freezed,
  }) {
    return _then(_MessageModel(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      attachments: attachments == freezed
          ? _value.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<AttachmentModel>?,
      messageSender: messageSender == freezed
          ? _value.messageSender
          : messageSender // ignore: cast_nullable_to_non_nullable
              as MessageSender?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      readAt: readAt == freezed
          ? _value.readAt
          : readAt // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_MessageModel with DiagnosticableTreeMixin implements _MessageModel {
  const _$_MessageModel(
      {this.id,
      this.attachments,
      this.messageSender,
      this.createdAt,
      this.updatedAt,
      this.readAt});

  factory _$_MessageModel.fromJson(Map<String, dynamic> json) =>
      _$$_MessageModelFromJson(json);

  @override
  final String? id;
  @override
  final List<AttachmentModel>? attachments;
  @override
  final MessageSender? messageSender;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;
  @override
  final int? readAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MessageModel(id: $id, attachments: $attachments, messageSender: $messageSender, createdAt: $createdAt, updatedAt: $updatedAt, readAt: $readAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MessageModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('attachments', attachments))
      ..add(DiagnosticsProperty('messageSender', messageSender))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty('readAt', readAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MessageModel &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.attachments, attachments) &&
            const DeepCollectionEquality()
                .equals(other.messageSender, messageSender) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality().equals(other.readAt, readAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(attachments),
      const DeepCollectionEquality().hash(messageSender),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt),
      const DeepCollectionEquality().hash(readAt));

  @JsonKey(ignore: true)
  @override
  _$MessageModelCopyWith<_MessageModel> get copyWith =>
      __$MessageModelCopyWithImpl<_MessageModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MessageModelToJson(this);
  }
}

abstract class _MessageModel implements MessageModel {
  const factory _MessageModel(
      {String? id,
      List<AttachmentModel>? attachments,
      MessageSender? messageSender,
      String? createdAt,
      String? updatedAt,
      int? readAt}) = _$_MessageModel;

  factory _MessageModel.fromJson(Map<String, dynamic> json) =
      _$_MessageModel.fromJson;

  @override
  String? get id;
  @override
  List<AttachmentModel>? get attachments;
  @override
  MessageSender? get messageSender;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;
  @override
  int? get readAt;
  @override
  @JsonKey(ignore: true)
  _$MessageModelCopyWith<_MessageModel> get copyWith =>
      throw _privateConstructorUsedError;
}
