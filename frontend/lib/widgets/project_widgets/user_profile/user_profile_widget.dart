import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tinder/generated/l10n.dart';
import 'package:tinder/models/tmp_models/user_model.dart';
import 'package:tinder/widgets/project_widgets/user_profile/user_profile_providers.dart';

class UserProfileWidget extends ConsumerWidget {
  const UserProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    const _loading = CircularProgressIndicator.adaptive();
    return ref.read(userProfileProvider).when(
        data: (profile) {
          return ListTile(
            title: Text(S.of(context).nick_ui_string(profile.nick)),
          );
        },
        error: (error, stack) => Text(error.toString()),
        loading: () => _loading);
  }
}
