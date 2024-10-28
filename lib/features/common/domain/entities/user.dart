import 'package:objectbox/objectbox.dart';

import '../../data/models/user_model.dart';
import 'reservation.dart';

@Entity()
class User {
  @Id()
  int objectId;
  String name;
  String phoneNumber;
  String email;
  String password;

  User({
    this.objectId = 0,
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.password,
  });

  factory User.fromModel(UserModel model) {
    return User(
      objectId: model.objectId ?? 0,
      name: model.name ?? '',
      phoneNumber: model.phoneNumber ?? '',
      email: model.email ?? '',
      password: model.password ?? '',
    );
  }

  UserModel toModel() {
    return UserModel(
      objectId: objectId,
      name: name,
      phoneNumber: phoneNumber,
      email: email,
      password: password,
    );
  }
}
