//Generated code

part of 'users_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$UsersService extends UsersService {
  _$UsersService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = UsersService;

  @override
  Future<Response<UserModel>> user() {
    final $url = '/user';
    final $request = Request('POST', $url, client.baseUrl);
    return client.send<UserModel, UserModel>($request);
  }

  @override
  Future<Response<UserModel>> findByNik(String nik) {
    final $url = '/user/find_by_nik';
    final $body = <String, dynamic>{'nik': nik};
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<UserModel, UserModel>($request);
  }

  @override
  Future<Response<dynamic>> updateUser(UserModel user) {
    final $url = '/user/update_user';
    final $body = <String, dynamic>{'user': user};
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }
}
