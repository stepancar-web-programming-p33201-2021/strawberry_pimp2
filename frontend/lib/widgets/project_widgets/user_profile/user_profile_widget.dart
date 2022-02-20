import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tinder/utils/constants.dart';
import 'package:tinder/widgets/project_widgets/messages/messages_provider.dart';
import 'package:tinder/widgets/project_widgets/user_profile/user_profile_providers.dart';

class UserProfileWidget extends HookConsumerWidget {
  const UserProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    const _loading = CircularProgressIndicator.adaptive();
    final model = ref.watch(userProfileControllerProvider.notifier);
    final state = ref.watch(userProfileControllerProvider);
    final textController = useTextEditingController();
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
              if (state.isError) Text(state.error ?? 'this is error'),
              ListTile(
                title: Text('create chat'),
                onTap: () {
                  _displayTextInputDialog(context, textController, ref);
                },
              ),
              ListTile(
                title: Text('update current chat'),
                onTap: () {
                  ref.refresh(messagesProvider);
                },
              ),
              ListTile(
                title: Text('update chats list'),
                onTap: () {
                  ref.refresh(messagesProvider);
                },
              ),
            ],
          );
        },
        error: (error, stack) => Text(error.toString()),
        loading: () => _loading);
  }
}

Future<void> _displayTextInputDialog(
    BuildContext context, controller, WidgetRef ref) async {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('User Id'),
          actions: [
            OutlinedButton(
                onPressed: () {
                  ref.read(userProfileControllerProvider.notifier).createChat();
                  Navigator.pop(context);
                },
                child: const Text('create'))
          ],
          content: TextField(
            onChanged: (value) {
              ref.read(userIdProvider.notifier).state = value;
            },
            controller: controller,
            decoration: const InputDecoration(hintText: "User Id'"),
          ),
        );
      });
}
