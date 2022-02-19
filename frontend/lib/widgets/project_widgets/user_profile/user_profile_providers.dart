import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tinder/models/services_models/loading_state.dart';
import 'package:tinder/models/tmp_models/user_model.dart';
import 'package:tinder/services/chopper_service/chopper_provider.dart';
import 'package:tinder/services/database_services/users_service/users_service.dart';


final userProfileProvider = FutureProvider<UserModel>((ref) async {
  final service = ref.watch(chopperProvider).getService<UsersService>();
  final response = await service.user();
  return response.body ?? const UserModel();
});

final userProfileControllerProvider =
    StateNotifierProvider<UserProfileNotifier, LoadingState>((ref) {
  return UserProfileNotifier(ref);
});

class UserProfileNotifier extends StateNotifier<LoadingState> {
  UserProfileNotifier(this.ref) : super(const LoadingState.complete());

  final StateNotifierProviderRef ref;

  void changeAccountType(bool? value) async {
    if (state.isLoading || value == null) {
      return;
    }
    final service = ref.read(chopperProvider).getService<UsersService>();
    final oldUserModel = ref.read(userProfileProvider).value!;
    final task =
        service.updateUser(UserModel(isAnonymous: !oldUserModel.isAnonymous));
    state = const LoadingState.loading();
    task
        .then((_) => state = const LoadingState.complete())
        .catchError((e) => state = LoadingState.error(e.toString()));
  }
}
