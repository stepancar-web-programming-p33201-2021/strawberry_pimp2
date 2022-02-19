import "dart:async";
import 'package:chopper/chopper.dart';
import 'package:tinder/models/tmp_models/chat_model.dart';
import 'package:tinder/models/tmp_models/user_model.dart';

// This is necessary for the generator to work.
part 'users_service.chopper.dart';

@ChopperApi(baseUrl: "/user")
abstract class UsersService extends ChopperService {
  @Post()
  Future<Response<UserModel>> user();

  @Post(path: '/find_by_nik')
  Future<Response<UserModel>> findByNik(@Field() String nik);

  @Post(path: '/update_user')
  Future<Response<void>> updateUser(@Field() UserModel user);

  // @Post(path: '/create_chat')
  // Future<Response> createChat(String anotherUid);

  // A helper method that helps instantiating the service. You can omit this method and use the generated class directly instead.
  static UsersService create([ChopperClient? client]) => _$UsersService(client);
}
