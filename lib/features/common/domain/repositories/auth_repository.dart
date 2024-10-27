import 'package:fpdart/fpdart.dart';

import '../../data/models/user_model.dart';

abstract class AuthRepository {
  Either<void, UserModel> authenticateUser(
      {required String email, required String password});

  Either<void, UserModel> registerUser({required UserModel userModel});

  Either<void, UserModel> getUserById({required int userId});
}
