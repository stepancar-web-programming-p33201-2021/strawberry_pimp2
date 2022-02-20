import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tinder/models/services_models/loading_state.dart';
import 'package:tinder/models/tmp_models/chat_model.dart';
import 'package:tinder/models/tmp_models/message_model.dart';
import 'package:tinder/models/tmp_models/user_model.dart';
import 'package:tinder/pages/chats_page/chats_provider.dart';
import 'package:tinder/services/chopper_service/chopper_provider.dart';
import 'package:tinder/services/database_services/chats_service/chats_service.dart';
import 'package:tinder/services/database_services/users_service/users_service.dart';
import 'package:tinder/widgets/project_widgets/messages/message_screen.dart';
import 'package:tinder/widgets/project_widgets/messages/messages_provider.dart';

final userProfileProvider = FutureProvider<UserModel>((ref) async {
  final service = ref.watch(chopperProvider).getService<UsersService>();
  final response = await service.user();
  return response.body ?? const UserModel();
});

final userIdProvider = StateProvider<String?>((ref) {
  return null;
});

final selectedChatIdProvider = StateProvider<int?>((ref) {
  return null;
});

final selectedChatProvider = StateProvider<ChatModel?>((ref) {
  final id = ref.watch(selectedChatIdProvider);
  if (id != null) {
    final chats = ref.watch(chatListProvider).value;
    return chats?[id];
  }
});

final userProfileControllerProvider =
    StateNotifierProvider<UserProfileNotifier, LoadingState>((ref) {
  return UserProfileNotifier(ref);
});

class UserProfileNotifier extends StateNotifier<LoadingState> {
  UserProfileNotifier(this.ref) : super(const LoadingState.complete());

  final StateNotifierProviderRef ref;

  void createChat() {
    if (state.isLoading) return;
    final id = ref.read(userIdProvider);
    if (id != null) {
      final service = ref.read(chopperProvider).getService<ChatsService>();
      final task = service.updateChat(id);
      state = const LoadingState.loading();
      task
          .then((response) => state = const LoadingState.complete())
          .catchError((e) => state = LoadingState.error(e.toString()))
          .then((value) => ref.refresh(chatListProvider));
    }
  }

  void sendMessage() {
    final id = ref.read(selectedChatIdProvider);
    final input = ref.read(inputProvider);
    if (id == null || input.isEmpty || state.isLoading) {
      return;
    }
    final chatsService = ref.read(chopperProvider).getService<ChatsService>();
    final message = MessageModel(attachments: [
      if (input.textAttach != null) input.textAttach!,
      ...input.other,
    ]);
    final task = chatsService.updateMessage(id, message);
    state = const LoadingState.loading();
    task
        .then((response) {
          ref.read(inputProvider.notifier).clear();
          state = const LoadingState.complete();
        })
        .catchError((e) {
          state = LoadingState.error(e.toString());
        })
        .then((value) => ref.refresh(messagesProvider));
  }

  void changeAccountType(bool? value) async {
    if (state.isLoading || value == null) {
      return;
    }
    final service = ref.read(chopperProvider).getService<UsersService>();
    final oldUserModel = ref.read(userProfileProvider).value!;
    final task = service.updateUser(UserModel(
      isAnonymous: !oldUserModel.isAnonymous,
      nick: oldUserModel.nick,
    ));
    state = const LoadingState.loading();
    task
        .then((response) => state = const LoadingState.complete())
        .catchError((e) => state = LoadingState.error(e.toString()))
        .then((value) => ref.refresh(userProfileProvider));
  }
}
