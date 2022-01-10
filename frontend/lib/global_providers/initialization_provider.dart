import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tinder/services/auth_service/auth_providers.dart';

final initializationProvider = Provider<void>((ref) {
  ref.read(authProvider);
  return;
});
