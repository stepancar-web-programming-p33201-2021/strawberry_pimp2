import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wakeup_command_model.freezed.dart';

part 'wakeup_command_model.g.dart';

@freezed
class WakeupCommand with _$WakeupCommand {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory WakeupCommand({
    required String jwt,
  }) = _WakeupCommand;

  factory WakeupCommand.fromJson(Map<String, dynamic> json) =>
      _$WakeupCommandFromJson(json);
}
