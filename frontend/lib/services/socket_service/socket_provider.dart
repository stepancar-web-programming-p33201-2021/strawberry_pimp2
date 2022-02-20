import 'dart:async';
import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tinder/models/services_models/chunk_command.dart';
import 'package:tinder/models/services_models/subscribe_command_model.dart';
import 'package:tinder/models/services_models/wakeup_command_model.dart';
import 'package:tinder/models/tmp_models/chat_model.dart';
import 'package:tinder/services/auth_service/auth_providers.dart';
import 'package:tinder/services/firebase_service/firebase_service.dart';
import 'package:tinder/utils/constants.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

final channel = WebSocketChannel.connect(
  Uri.parse(wsServerLink),
);

final socketSinkProvider = Provider.autoDispose<WebSocketSink>((ref) {
  ref.onDispose(() {
    ref.state.close();
  });
  return channel.sink;
});

final socketStreamProvider = Provider.autoDispose<Stream>((ref) {
  return channel.stream.asBroadcastStream();
});

Stream<SubscribeCommand> wakeUpStream(
  AutoDisposeStreamProviderRef ref,
  Future<SubscribeCommand> Function() commandGen,
  int timeout,
) async* {
  yield await commandGen();

  for (;;) {
    await Future.delayed(Duration(milliseconds: timeout));
    yield await commandGen();
  }
}

final chatsStreamProvider =
    StreamProvider.autoDispose<List<ChatModel>>((ref) async* {
  const chatTimeout = 1000 * 60 * 60;

  final socket = ref.watch(socketSinkProvider);

  Future<SubscribeCommand> chatSubCommand() async {
    var token = await ref.watch(authServiceProvider.notifier).idToken();
    return SubscribeCommand(
        token: token!, method: 'subscribeChats', timeout: chatTimeout);
  }

  final sub = wakeUpStream(ref, chatSubCommand, chatTimeout).listen((event) {
    socket.add(jsonEncode(event.toJson()));
  });
  ref.onDispose(() {
    sub.cancel();
  });

  final stream = ref.watch(socketStreamProvider);
  await for(final rawChunk in stream){
    final chunk = ChunkCommand.fromJson(jsonDecode(rawChunk));
    chunk.key;
    if(chunk.key == 'subscribeChats'){
      final rawChats = jsonDecode(chunk.answer!);
      print(rawChats);
    }
  }

});
