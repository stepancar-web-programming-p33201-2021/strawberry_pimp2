import "dart:async";
import 'package:chopper/chopper.dart';
import 'package:tinder/models/tmp_models/chat_model.dart';

// This is necessary for the generator to work.
part 'chats_service.chopper.dart';

@ChopperApi(baseUrl: "/chats")
abstract class ChatsService extends ChopperService {
  @Post()
  Future<Response<List<ChatModel>>> getChats();

  @Post(path: '/create_chat')
  Future<Response> createChat(String anotherUid);

  // A helper method that helps instantiating the service. You can omit this method and use the generated class directly instead.
  static ChatsService create([ChopperClient? client]) => _$ChatsService(client);
}
