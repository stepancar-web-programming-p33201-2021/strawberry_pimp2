import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tinder/utils/constants.dart';
import 'package:tinder/widgets/project_widgets/user_profile/user_profile_providers.dart';

class UserProfileWidget extends ConsumerWidget {
  const UserProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    const _loading = CircularProgressIndicator.adaptive();
    final model = ref.watch(userProfileControllerProvider.notifier);
    final state = ref.watch(userProfileControllerProvider);
    return ref.watch(userProfileProvider).when(
        data: (profile) {
          final nick = context.s.nick_ui_string(profile.nick);
          final account = profile.isAnonymous
              ? context.s.closed_account
              : context.s.open_account;
          final title = '$nick - $account';
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CheckboxListTile(
                title: SelectableText(title),
                subtitle: SelectableText(context.s.id_ui_string(profile.uid!)),
                onChanged: state.isLoading ? null : model.changeAccountType,
                value: !profile.isAnonymous,
              ),
              if (state.isLoading) const LinearProgressIndicator(),
              if (state.isError) Text(state.error!),
            ],
          );
        },
        error: (error, stack) => Text(error.toString()),
        loading: () => _loading);
  }
}
