import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tinder/models/tmp_models/user_model.dart';
import 'package:tinder/services/chopper_service/chopper_provider.dart';
import 'package:tinder/services/database_services/users_service/users_service.dart';

final userProfileProvider = FutureProvider<UserModel>((ref) async {
  final service = ref.read(chopperProvider).getService<UsersService>();
  final response = await service.user();
  return response.body ?? const UserModel();
});
