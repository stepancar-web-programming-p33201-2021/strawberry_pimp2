import "dart:async";
import 'package:chopper/chopper.dart';
import 'package:tinder/models/tmp_models/chat_model.dart';
import 'package:tinder/models/tmp_models/message_model.dart';

// This is necessary for the generator to work.
part 'chats_service.chopper.dart';

@ChopperApi(baseUrl: "/chats")
abstract class ChatsService extends ChopperService {
  @Post()
  Future<Response<List<ChatModel>>> chats();

  @Post(path: '/messages')
  Future<Response<List<MessageModel>>> messages(@Field() int chatId);

  @Post(path: '/update_chat')
  Future<Response> updateChat(@Field() String anotherUid);

  @Post(path: '/update_message')
  Future<Response> updateMessage(
      @Field() int chatId, @Field() MessageModel message);

  // A helper method that helps instantiating the service. You can omit this method and use the generated class directly instead.
  static ChatsService create([ChopperClient? client]) => _$ChatsService(client);
}
