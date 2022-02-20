import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tinder/models/tmp_models/message_model.dart';
import 'package:tinder/services/chopper_service/chopper_provider.dart';
import 'package:tinder/services/database_services/chats_service/chats_service.dart';
import 'package:tinder/widgets/project_widgets/user_profile/user_profile_providers.dart';

final messagesProvider = FutureProvider<List<MessageModel>>((ref) async {
  final service = ref.watch(chopperProvider).getService<ChatsService>();
  final id = ref.watch(selectedChatIdProvider);
  if (id != null) {
    final response = await service.messages(id);
    return response.body ?? [];
  }
  return [];
});
