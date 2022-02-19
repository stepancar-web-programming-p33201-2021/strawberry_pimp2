import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'loading_state.freezed.dart';

part 'loading_state.g.dart';

@freezed
class LoadingState with _$LoadingState {
  const LoadingState._();

  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory LoadingState.loading() = _LoadingStateLoading;

  const factory LoadingState.error(String error) = _LoadingStateError;

  // const factory LoadingState.initial() = _LoadingStateInitial;
  const factory LoadingState.complete() = _LoadingStateComplete;

  factory LoadingState.fromJson(Map<String, dynamic> json) =>
      _$LoadingStateFromJson(json);

  bool get isLoading {
    return whenOrNull(loading: () => true) ?? false;
  }
  bool get isError {
    return whenOrNull(error: (_) => true) ?? false;
  }

  String? get error {
    return whenOrNull(error: (e) => e.toString());
  }
}
