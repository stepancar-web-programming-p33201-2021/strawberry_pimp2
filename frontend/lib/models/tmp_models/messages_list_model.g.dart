// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MessagesList _$$_MessagesListFromJson(Map<String, dynamic> json) =>
    _$_MessagesList(
      id: json['id'] as String?,
      messages: (json['messages'] as List<dynamic>?)
          ?.map((e) => MessageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_MessagesListToJson(_$_MessagesList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'messages': instance.messages?.map((e) => e.toJson()).toList(),
    };
