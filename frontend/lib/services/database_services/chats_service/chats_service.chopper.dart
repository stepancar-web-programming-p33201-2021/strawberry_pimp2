//Generated code

part of 'chats_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$ChatsService extends ChatsService {
  _$ChatsService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ChatsService;

  @override
  Future<Response<List<ChatModel>>> chats() {
    final $url = '/chats';
    final $request = Request('POST', $url, client.baseUrl);
    return client.send<List<ChatModel>, ChatModel>($request);
  }

  @override
  Future<Response<List<MessageModel>>> messages(int chatId) {
    final $url = '/chats/messages';
    final $body = <String, dynamic>{'chatId': chatId};
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<List<MessageModel>, MessageModel>($request);
  }

  @override
  Future<Response<dynamic>> updateChat(String anotherUid) {
    final $url = '/chats/update_chat';
    final $body = <String, dynamic>{'anotherUid': anotherUid};
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> updateMessage(int chatId, MessageModel message) {
    final $url = '/chats/update_message';
    final $body = <String, dynamic>{'chatId': chatId, 'message': message};
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }
}
