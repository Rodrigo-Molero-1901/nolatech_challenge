import '../../../common/data/models/user_model.dart';

class UserViewModel {
  final String name;
  final String fullName;

  UserViewModel.fromModel(UserModel model)
      : name = (model.name ?? '').split(' ').first,
        fullName = model.name ?? '';
}
