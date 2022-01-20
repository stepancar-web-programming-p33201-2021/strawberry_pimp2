import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tinder/navigation/router_delegate.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return routerDelegate;
});
