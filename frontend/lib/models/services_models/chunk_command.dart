import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chunk_command.freezed.dart';

part 'chunk_command.g.dart';

@freezed
class ChunkCommand with _$ChunkCommand {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory ChunkCommand({String? key, String? answer}) = _ChunkCommand;

  factory ChunkCommand.fromJson(Map<String, dynamic> json) =>
      _$ChunkCommandFromJson(json);
}
