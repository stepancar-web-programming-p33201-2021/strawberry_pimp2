// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscribe_command_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SubscribeCommand _$$_SubscribeCommandFromJson(Map<String, dynamic> json) =>
    _$_SubscribeCommand(
      method: json['method'] as String,
      token: json['token'] as String,
      params: json['params'] as String?,
      timeout: json['timeout'] as int,
    );

Map<String, dynamic> _$$_SubscribeCommandToJson(_$_SubscribeCommand instance) =>
    <String, dynamic>{
      'method': instance.method,
      'token': instance.token,
      'params': instance.params,
      'timeout': instance.timeout,
    };
