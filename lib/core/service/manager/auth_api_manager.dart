import 'package:fpdart/fpdart.dart';

import '../../../features/features.dart';
import '../api/api.dart';

class AuthApiManager {
  final Api _api;

  AuthApiManager(this._api);

  Either<void, User> authenticateUser({
    required String email,
    required String password,
  }) {
    try {
      final authenticatedUser = _api.authApi.authenticateUser(
        email: email,
        password: password,
      );
      if (authenticatedUser == null) return const Left(null);
      return Right(authenticatedUser);
    } catch (_) {
      return const Left(null);
    }
  }

  Either<void, User> registerUser({required UserModel userModel}) {
    try {
      final registeredUser = _api.authApi.registerUser(
        user: User.fromModel(userModel),
      );
      if (registeredUser == null) return const Left(null);
      return Right(registeredUser);
    } catch (_) {
      return const Left(null);
    }
  }

  Either<void, User> getUserById({required int userId}) {
    try {
      final user = _api.authApi.getUserById(userId: userId);
      if (user == null) return const Left(null);
      return Right(user);
    } catch (_) {
      return const Left(null);
    }
  }
}
