import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tinder/generated/l10n.dart';
import 'package:tinder/global_providers/initialization_provider.dart';
import 'package:tinder/global_providers/router_provider.dart';
import 'package:tinder/services/app_lifecycle_service/app_lifecycle_provider.dart';
import 'package:tinder/services/app_lifecycle_service/app_lifecycle_state.dart';

final container = ProviderContainer();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(UncontrolledProviderScope(
    child: const TinderApp(),
    container: container,
  ));
}

class TinderApp extends ConsumerStatefulWidget {
  const TinderApp({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _TinderAppState();
}

class _TinderAppState extends ConsumerState<TinderApp> with AfterLayoutMixin {
  @override
  void initState() {
    ref.read(initializationProvider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'TinderApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      routeInformationParser: ref.watch(routerProvider).routeInformationParser,
      routerDelegate: ref.watch(routerProvider).routerDelegate,
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    ref.read(appLifecycleProvider.notifier).state = AppLifecycle.uiLoaded;
  }
}
