import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initializing() = _AuthStateInitializing;

  const factory AuthState.no() = _AuthStateNo;

  const factory AuthState.ready() = _AuthStateReady;

  const factory AuthState.error(String errorText) = _AuthStateError;
}
