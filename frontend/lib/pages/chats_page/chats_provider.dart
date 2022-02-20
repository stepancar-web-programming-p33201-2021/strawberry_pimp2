import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tinder/models/tmp_models/chat_model.dart';
import 'package:tinder/services/chopper_service/chopper_provider.dart';
import 'package:tinder/services/database_services/chats_service/chats_service.dart';

final chatListProvider = FutureProvider<List<ChatModel>>((ref) async {
  final chatsService = ref.watch(chopperProvider).getService<ChatsService>();
  final chatsResponse = await chatsService.chats();
  final chats = chatsResponse.body ?? [];
  return chats;
});
