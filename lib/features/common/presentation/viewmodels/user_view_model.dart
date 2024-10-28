import '../../data/models/user_model.dart';

class UserViewModel {
  final int id;
  final String name;
  final String fullName;

  UserViewModel.fromModel(UserModel model)
      : id = model.objectId ?? 0,
        name = (model.name ?? '').split(' ').first,
        fullName = model.name ?? '';
}
