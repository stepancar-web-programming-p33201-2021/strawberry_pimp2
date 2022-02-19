// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      nick: json['nick'] as String? ?? keywordAnonymous,
      isAnonymous: json['is_anonymous'] as bool? ?? true,
      uid: json['uid'] as String?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) {
  final val = <String, dynamic>{
    'nick': instance.nick,
    'is_anonymous': instance.isAnonymous,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('uid', instance.uid);
  writeNotNull('created_at', instance.createdAt);
  return val;
}
