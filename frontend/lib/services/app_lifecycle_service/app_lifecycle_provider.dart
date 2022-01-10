import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tinder/services/app_lifecycle_service/app_lifecycle_state.dart';

final appLifecycleProvider =
    StateProvider<AppLifecycle>((ref) => AppLifecycle.launched);
