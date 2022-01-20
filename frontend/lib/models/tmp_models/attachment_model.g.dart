// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AttachmentModel _$$_AttachmentModelFromJson(Map<String, dynamic> json) =>
    _$_AttachmentModel(
      type: $enumDecodeNullable(_$AttachmentTypeEnumMap, json['type']),
      content: json['content'] as String?,
    );

Map<String, dynamic> _$$_AttachmentModelToJson(_$_AttachmentModel instance) =>
    <String, dynamic>{
      'type': _$AttachmentTypeEnumMap[instance.type],
      'content': instance.content,
    };

const _$AttachmentTypeEnumMap = {
  AttachmentType.document: 'document',
  AttachmentType.text: 'text',
  AttachmentType.image: 'image',
  AttachmentType.sticker: 'sticker',
};
