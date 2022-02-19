import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tinder/models/tmp_models/attachment_model.dart';

part 'input_state.freezed.dart';

part 'input_state.g.dart';

@freezed
class InputState with _$InputState {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory InputState({
    AttachmentModel? textAttach,
    @Default([]) List<AttachmentModel> other,
  }) = _InputState;

  factory InputState.fromJson(Map<String, dynamic> json) =>
      _$InputStateFromJson(json);
}
