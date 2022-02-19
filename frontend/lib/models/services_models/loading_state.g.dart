// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loading_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoadingStateLoading _$$_LoadingStateLoadingFromJson(
        Map<String, dynamic> json) =>
    _$_LoadingStateLoading(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_LoadingStateLoadingToJson(
        _$_LoadingStateLoading instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$_LoadingStateError _$$_LoadingStateErrorFromJson(Map<String, dynamic> json) =>
    _$_LoadingStateError(
      json['error'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_LoadingStateErrorToJson(
        _$_LoadingStateError instance) =>
    <String, dynamic>{
      'error': instance.error,
      'runtimeType': instance.$type,
    };

_$_LoadingStateComplete _$$_LoadingStateCompleteFromJson(
        Map<String, dynamic> json) =>
    _$_LoadingStateComplete(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_LoadingStateCompleteToJson(
        _$_LoadingStateComplete instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };
