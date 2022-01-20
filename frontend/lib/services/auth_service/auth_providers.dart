import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tinder/global_providers/router_provider.dart';
import 'package:tinder/navigation/routes.dart';
import 'package:tinder/services/app_lifecycle_service/app_lifecycle_provider.dart';
import 'package:tinder/services/app_lifecycle_service/app_lifecycle_state.dart';
import 'package:tinder/services/auth_service/auth_service.dart';
import 'package:tinder/services/auth_service/auth_state.dart';

final authServiceProvider =
    StateNotifierProvider<AuthService, AuthState>((ref) => AuthService(ref));

final authProvider = Provider<void>((ref) {
  final authServiceState = ref.watch(authServiceProvider.notifier);
  final appLifecycleState = ref.watch(appLifecycleProvider);

  return;
});
