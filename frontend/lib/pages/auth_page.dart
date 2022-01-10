import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tinder/generated/l10n.dart';
import 'package:tinder/services/auth_service/auth_providers.dart';

class AuthPage extends ConsumerWidget {
  const AuthPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _s = S.of(context);
    const progressIndicator = CircularProgressIndicator.adaptive();
    final buttons = Wrap(
      children: [
        Text(_s.welcome_ui_string),
        MaterialButton(
          onPressed: () =>
              ref.read(authServiceProvider.notifier).signInWithGoogle(),
          child: Text(_s.sign_in_google_ui_string),
        ),
        MaterialButton(
          onPressed: () =>
              ref.read(authServiceProvider.notifier).signInWithAnonymously(),
          child: Text(_s.sign_in_anonymous_ui_string),
        ),
      ],
    );
    final body = ref.watch(authServiceProvider).when<Widget>(
          initializing: () => progressIndicator,
          no: () => buttons,
          ready: () => buttons,
          error: (e) => Text(e),
        );
    return Scaffold(
      body: Center(
        child: AnimatedSwitcher(duration: kThemeAnimationDuration, child: body),
      ),
    );
  }
}
