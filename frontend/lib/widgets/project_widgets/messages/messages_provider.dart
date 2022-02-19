import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tinder/models/tmp_models/message_model.dart';

final messagesProvider = FutureProvider<List<MessageModel>>((ref) async {
  return [];
});
