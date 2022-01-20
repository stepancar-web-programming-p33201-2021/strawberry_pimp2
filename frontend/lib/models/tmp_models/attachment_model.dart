import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'attachment_model.freezed.dart';

part 'attachment_model.g.dart';

@freezed
class AttachmentModel with _$AttachmentModel {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory AttachmentModel({
    AttachmentType? type,
    String? content,
  }) = _AttachmentModel;

  factory AttachmentModel.document(String documentUrl) {
    return AttachmentModel(type: AttachmentType.document, content: documentUrl);
  }

  factory AttachmentModel.text(String text) {
    return AttachmentModel(type: AttachmentType.text, content: text);
  }

  factory AttachmentModel.image(String imageUrl) {
    return AttachmentModel(type: AttachmentType.image, content: imageUrl);
  }

  factory AttachmentModel.sticker(String sticker) {
    return AttachmentModel(type: AttachmentType.sticker, content: sticker);
  }

  factory AttachmentModel.fromJson(Map<String, dynamic> json) =>
      _$AttachmentModelFromJson(json);
}

enum AttachmentType { document, text, image, sticker }
