// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'input_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_InputState _$$_InputStateFromJson(Map<String, dynamic> json) =>
    _$_InputState(
      textAttach: json['text_attach'] == null
          ? null
          : AttachmentModel.fromJson(
              json['text_attach'] as Map<String, dynamic>),
      other: (json['other'] as List<dynamic>?)
              ?.map((e) => AttachmentModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_InputStateToJson(_$_InputState instance) =>
    <String, dynamic>{
      'text_attach': instance.textAttach?.toJson(),
      'other': instance.other.map((e) => e.toJson()).toList(),
    };
