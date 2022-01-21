import 'package:chopper/chopper.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tinder/main.dart';
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
