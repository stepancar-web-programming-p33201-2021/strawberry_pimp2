// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AttachmentModel _$$_AttachmentModelFromJson(Map<String, dynamic> json) =>
    _$_AttachmentModel(
      type: $enumDecode(_$AttachmentTypeEnumMap, json['type']),
      content: json['content'] as String?,
      id: json['id'] as int?,
      uint8list: uFromJson(json['uint8list']),
    );

Map<String, dynamic> _$$_AttachmentModelToJson(_$_AttachmentModel instance) {
  final val = <String, dynamic>{
    'type': _$AttachmentTypeEnumMap[instance.type],
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('content', instance.content);
  writeNotNull('id', instance.id);
  writeNotNull('uint8list', uint8toJson(instance.uint8list));
  return val;
}

const _$AttachmentTypeEnumMap = {
  AttachmentType.document: 'document',
  AttachmentType.text: 'text',
  AttachmentType.image: 'image',
  AttachmentType.sticker: 'sticker',
};
