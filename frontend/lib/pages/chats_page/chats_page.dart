import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tinder/generated/l10n.dart';
import 'package:tinder/models/tmp_models/chat_model.dart';
import 'package:tinder/services/auth_service/auth_providers.dart';
import 'package:tinder/widgets/project_widgets/messages/message_screen.dart';
import 'package:tinder/widgets/project_widgets/user_profile/user_profile_providers.dart';
import 'package:tinder/widgets/project_widgets/user_profile/user_profile_widget.dart';
import 'chats_provider.dart';

part 'chats_list_part.dart';

class ChatsPage extends HookConsumerWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,ref) {
    const userWidget = SliverToBoxAdapter(child: UserProfileWidget());
    const chatsList = CustomScrollView(
      slivers: [
        userWidget,
        ChatsList(),
      ],
    );
    const selectedChat = MessagesScreen();

    ///TODO do smth on resize
    return Material(
        child: Center(
      child: FractionallySizedBox(
        widthFactor: .5,
        child: Row(
          children: [
            Flexible(flex: 2, child: chatsList),
            Flexible(flex: 4, child: selectedChat)
          ],
        ),
      ),
    ));
  }
}


