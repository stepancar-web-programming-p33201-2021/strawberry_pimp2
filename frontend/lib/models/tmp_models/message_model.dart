import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tinder/models/tmp_models/attachment_model.dart';

part 'message_model.freezed.dart';

part 'message_model.g.dart';

@freezed
class MessageModel with _$MessageModel {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory MessageModel({
    String? id,
    List<AttachmentModel>? attachments,
    MessageSender? messageSender,
    int? createdAt,
    int? updatedAt,
    int? readAt
  }) = _MessageModel;

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);
}

enum MessageSender { a, b }
