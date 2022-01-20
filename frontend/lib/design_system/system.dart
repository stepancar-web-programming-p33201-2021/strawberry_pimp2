import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tinder/design_system/schemes/basic_scheme/scheme.dart';

final themeProvider = Provider<BasicScheme>((ref) {
  return BasicScheme();
});
