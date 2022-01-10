import 'package:beamer/beamer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tinder/navigation/router_delegate.dart';

final routerProvider = Provider<BeamerDelegate>((ref) {
  return routerDelegate;
});
