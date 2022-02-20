import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscribe_command_model.freezed.dart';

part 'subscribe_command_model.g.dart';

@freezed
class SubscribeCommand with _$SubscribeCommand {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory SubscribeCommand({
    required String method,
    required String token,
    String? params,
    required int timeout, // in millis
  }) = _SubscribeCommand;

  factory SubscribeCommand.fromJson(Map<String, dynamic> json) =>
      _$SubscribeCommandFromJson(json);
}
