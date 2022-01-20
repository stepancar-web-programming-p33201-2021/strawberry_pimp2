// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MessageModel _$$_MessageModelFromJson(Map<String, dynamic> json) =>
    _$_MessageModel(
      id: json['id'] as String?,
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => AttachmentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      messageSender:
          $enumDecodeNullable(_$MessageSenderEnumMap, json['message_sender']),
      createdAt: json['created_at'] as int?,
      updatedAt: json['updated_at'] as int?,
      readAt: json['read_at'] as int?,
    );

Map<String, dynamic> _$$_MessageModelToJson(_$_MessageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'attachments': instance.attachments?.map((e) => e.toJson()).toList(),
      'message_sender': _$MessageSenderEnumMap[instance.messageSender],
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'read_at': instance.readAt,
    };

const _$MessageSenderEnumMap = {
  MessageSender.a: 'a',
  MessageSender.b: 'b',
};
