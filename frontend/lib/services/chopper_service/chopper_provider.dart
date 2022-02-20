import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tinder/main.dart';
import 'package:tinder/models/tmp_models/chat_model.dart';
import 'package:tinder/models/tmp_models/message_model.dart';
import 'package:tinder/models/tmp_models/user_model.dart';
import 'package:tinder/services/auth_service/auth_providers.dart';
import 'package:tinder/services/database_services/chats_service/chats_service.dart';
import 'package:tinder/services/database_services/users_service/users_service.dart';
import 'package:tinder/utils/constants.dart';

final chopperProvider = Provider<ChopperClient>((ref) {
  return ChopperClient(
    baseUrl: serverLink,
    interceptors: [
      const FirebaseAuthInterceptor({}),
    ],
    services: [
      // Create and pass an instance of the generated service to the client
      ChatsService.create(),
      UsersService.create()
    ],
    converter: JsonToTypeConverter({
      UserModel: (json) => UserModel.fromJson(json),
      ChatModel: (json) => ChatModel.fromJson(json),
      MessageModel: (json) => MessageModel.fromJson(json),
    }),
  );
});

class FirebaseAuthInterceptor extends HeadersInterceptor {
  const FirebaseAuthInterceptor(Map<String, String> headers) : super(headers);

  @override
  Future<Request> onRequest(Request request) async {
    final authService = container.read(authServiceProvider.notifier);
    final token = await authService.idToken();
    return applyHeaders(request, {authTokenKeyword: token ?? ''});
  }
}

class JsonToTypeConverter extends JsonConverter {
  final Map<Type, Function> typeToJsonFactoryMap;

  const JsonToTypeConverter(this.typeToJsonFactoryMap);

  @override
  Response<BodyType> convertResponse<BodyType, InnerType>(Response response) {
    return response.copyWith(
        body: fromJsonData<BodyType, InnerType>(
      response.body,
      typeToJsonFactoryMap[InnerType]!,
    ));
  }

  T fromJsonData<T, InnerType>(String jsonData, Function jsonParser) {
    var jsonMap = json.decode(jsonData);

    if (jsonMap is List) {
      return jsonMap
          .map((item) => jsonParser(item as Map<String, dynamic>) as InnerType)
          .toList() as T;
    }

    return jsonParser(jsonMap);
  }
}
