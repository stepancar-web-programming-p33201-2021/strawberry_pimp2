import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tinder/models/tmp_models/user_model.dart';

part 'chat_model.freezed.dart';

part 'chat_model.g.dart';

@freezed
class ChatModel with _$ChatModel {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory ChatModel({
    int? id,
    UserModel? userA,
    UserModel? userB,
    String? createdAt,
    String? messagesListId,
    String? lastMessage
  }) = _ChatModel;

  factory ChatModel.fromJson(Map<String, dynamic> json) =>
      _$ChatModelFromJson(json);
}

extension F on ChatModel {
  UserModel anotherUser(String currentUid) {
    if (userA!.uid == currentUid) {
      return userB!;
    } else {
      return userA!;
    }
  }
}
