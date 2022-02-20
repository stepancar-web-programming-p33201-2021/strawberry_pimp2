import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'attachment_model.freezed.dart';

part 'attachment_model.g.dart';

@freezed
class AttachmentModel with _$AttachmentModel {
  const AttachmentModel._();

  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true, includeIfNull: false)
  const factory AttachmentModel({
    required AttachmentType type,
    String? content,
    int? id,
    @JsonKey(toJson: uint8toJson, fromJson: uFromJson) Uint8List? uint8list,
  }) = _AttachmentModel;

  factory AttachmentModel.document(String documentUrl, Uint8List uint8list) {
    return AttachmentModel(
        type: AttachmentType.document,
        content: documentUrl,
        uint8list: uint8list);
  }

  factory AttachmentModel.text(String text) {
    return AttachmentModel(type: AttachmentType.text, content: text);
  }

  factory AttachmentModel.image(String imageUrl) {
    return AttachmentModel(type: AttachmentType.image, content: imageUrl);
  }

  factory AttachmentModel.imageUint(String imageUrl, Uint8List uint8list) {
    return AttachmentModel(
        type: AttachmentType.image, content: imageUrl, uint8list: uint8list);
  }

  factory AttachmentModel.sticker(String sticker) {
    return AttachmentModel(type: AttachmentType.sticker, content: sticker);
  }

  factory AttachmentModel.fromJson(Map<String, dynamic> json) =>
      _$AttachmentModelFromJson(json);
}

enum AttachmentType { document, text, image, sticker }

List<int>? uint8toJson(Uint8List? uint8list) {
  if (uint8list != null) {
    return uint8list.toList();
  }
  return null;
}

uFromJson(_) => null;
