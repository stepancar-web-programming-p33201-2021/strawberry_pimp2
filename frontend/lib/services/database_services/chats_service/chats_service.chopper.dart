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
  Future<Response<List<ChatModel>>> getChats() {
    final $url = '/chats';
    final $request = Request('POST', $url, client.baseUrl);
    return client.send<List<ChatModel>, ChatModel>($request);
  }

  @override
  Future<Response<dynamic>> createChat(String anotherUid) {
    final $url = '/chats/create_chat';
    final $request = Request('POST', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
