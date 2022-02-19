part of 'chats_page.dart';

class ChatsList extends ConsumerWidget {
  const ChatsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    const _loadingIndicator =
        SliverToBoxAdapter(child: CircularProgressIndicator.adaptive());
    final _userId = ref.read(authServiceProvider.notifier).userId;
    final widget2display = ref.watch(chatListProvider).when(
        data: (chatsList) {
          if (chatsList.isEmpty) {
            return SliverToBoxAdapter(
              child: Text(S.of(context).there_is_no_chats_ui_string),
            );
          }
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final chat = chatsList[index];
                return ListTile(
                  selectedColor: Colors.blue[100 * (index % 9 + 1)],
                  title: Text(
                    "Chat with ${chat.anotherUser(_userId).nick}",
                  ),
                  onTap: () {
                    ref.read(selectedChatIdProvider.notifier).state = chat.id;
                  },
                );
              },
              childCount: chatsList.length, // 1000 list items
            ),
          );
        },
        error: (error, stack) =>
            SliverToBoxAdapter(child: Text(error.toString())),
        loading: () => _loadingIndicator);
    return widget2display;
  }
}
