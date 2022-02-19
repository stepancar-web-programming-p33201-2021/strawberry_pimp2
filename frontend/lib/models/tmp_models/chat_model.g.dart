// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatModel _$$_ChatModelFromJson(Map<String, dynamic> json) => _$_ChatModel(
      id: json['id'] as int?,
      userA: json['user_a'] == null
          ? null
          : UserModel.fromJson(json['user_a'] as Map<String, dynamic>),
      userB: json['user_b'] == null
          ? null
          : UserModel.fromJson(json['user_b'] as Map<String, dynamic>),
      createdAt: json['created_at'] as String?,
      messagesListId: json['messages_list_id'] as String?,
      lastMessage: json['last_message'] as String?,
    );

Map<String, dynamic> _$$_ChatModelToJson(_$_ChatModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_a': instance.userA?.toJson(),
      'user_b': instance.userB?.toJson(),
      'created_at': instance.createdAt,
      'messages_list_id': instance.messagesListId,
      'last_message': instance.lastMessage,
    };
