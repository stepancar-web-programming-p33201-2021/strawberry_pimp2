import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tinder/generated/l10n.dart';
import 'package:tinder/models/tmp_models/chat_model.dart';
import 'package:tinder/services/auth_service/auth_providers.dart';
import 'chats_provider.dart';
part 'chats_list_part.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chatsList = CustomScrollView(
      slivers: [
        SliverAppBar(title: Text(S.of(context).your_chats_ui_string)),
        const ChatsList(),
      ],
    );
    const selectedChat = Placeholder();

    ///TODO do smth on resize
    return Material(
        child: Center(
      child: FractionallySizedBox(
        widthFactor: .5,
        child: Row(
          children: [
            Flexible(flex: 2, child: chatsList),
            const Flexible(flex: 4, child: selectedChat)
          ],
        ),
      ),
    ));
  }
}
