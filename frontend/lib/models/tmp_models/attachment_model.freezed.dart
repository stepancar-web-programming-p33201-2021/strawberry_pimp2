// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'attachment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AttachmentModel _$AttachmentModelFromJson(Map<String, dynamic> json) {
  return _AttachmentModel.fromJson(json);
}

/// @nodoc
class _$AttachmentModelTearOff {
  const _$AttachmentModelTearOff();

  _AttachmentModel call({AttachmentType? type, String? content, String? id}) {
    return _AttachmentModel(
      type: type,
      content: content,
      id: id,
    );
  }

  AttachmentModel fromJson(Map<String, Object?> json) {
    return AttachmentModel.fromJson(json);
  }
}

/// @nodoc
const $AttachmentModel = _$AttachmentModelTearOff();

/// @nodoc
mixin _$AttachmentModel {
  AttachmentType? get type => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AttachmentModelCopyWith<AttachmentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttachmentModelCopyWith<$Res> {
  factory $AttachmentModelCopyWith(
          AttachmentModel value, $Res Function(AttachmentModel) then) =
      _$AttachmentModelCopyWithImpl<$Res>;
  $Res call({AttachmentType? type, String? content, String? id});
}

/// @nodoc
class _$AttachmentModelCopyWithImpl<$Res>
    implements $AttachmentModelCopyWith<$Res> {
  _$AttachmentModelCopyWithImpl(this._value, this._then);

  final AttachmentModel _value;
  // ignore: unused_field
  final $Res Function(AttachmentModel) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? content = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AttachmentType?,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$AttachmentModelCopyWith<$Res>
    implements $AttachmentModelCopyWith<$Res> {
  factory _$AttachmentModelCopyWith(
          _AttachmentModel value, $Res Function(_AttachmentModel) then) =
      __$AttachmentModelCopyWithImpl<$Res>;
  @override
  $Res call({AttachmentType? type, String? content, String? id});
}

/// @nodoc
class __$AttachmentModelCopyWithImpl<$Res>
    extends _$AttachmentModelCopyWithImpl<$Res>
    implements _$AttachmentModelCopyWith<$Res> {
  __$AttachmentModelCopyWithImpl(
      _AttachmentModel _value, $Res Function(_AttachmentModel) _then)
      : super(_value, (v) => _then(v as _AttachmentModel));

  @override
  _AttachmentModel get _value => super._value as _AttachmentModel;

  @override
  $Res call({
    Object? type = freezed,
    Object? content = freezed,
    Object? id = freezed,
  }) {
    return _then(_AttachmentModel(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AttachmentType?,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_AttachmentModel
    with DiagnosticableTreeMixin
    implements _AttachmentModel {
  const _$_AttachmentModel({this.type, this.content, this.id});

  factory _$_AttachmentModel.fromJson(Map<String, dynamic> json) =>
      _$$_AttachmentModelFromJson(json);

  @override
  final AttachmentType? type;
  @override
  final String? content;
  @override
  final String? id;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AttachmentModel(type: $type, content: $content, id: $id)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AttachmentModel'))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('content', content))
      ..add(DiagnosticsProperty('id', id));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AttachmentModel &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            const DeepCollectionEquality().equals(other.id, id));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(content),
      const DeepCollectionEquality().hash(id));

  @JsonKey(ignore: true)
  @override
  _$AttachmentModelCopyWith<_AttachmentModel> get copyWith =>
      __$AttachmentModelCopyWithImpl<_AttachmentModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AttachmentModelToJson(this);
  }
}

abstract class _AttachmentModel implements AttachmentModel {
  const factory _AttachmentModel(
      {AttachmentType? type, String? content, String? id}) = _$_AttachmentModel;

  factory _AttachmentModel.fromJson(Map<String, dynamic> json) =
      _$_AttachmentModel.fromJson;

  @override
  AttachmentType? get type;
  @override
  String? get content;
  @override
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$AttachmentModelCopyWith<_AttachmentModel> get copyWith =>
      throw _privateConstructorUsedError;
}
