import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tinder/models/tmp_models/message_model.dart';

part 'messages_list_model.freezed.dart';

part 'messages_list_model.g.dart';

@freezed
class MessagesList with _$MessagesList {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory MessagesList({
    String? id,
    List<MessageModel>? messages
  }) = _MessagesList;

  factory MessagesList.fromJson(Map<String, dynamic> json) =>
      _$MessagesListFromJson(json);
}
