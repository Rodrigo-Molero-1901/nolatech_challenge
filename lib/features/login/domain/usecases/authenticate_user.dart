import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../common/data/models/user_model.dart';
import '../../../common/domain/repositories/auth_repository.dart';

@injectable
class AuthenticateUserUseCase {
  final AuthRepository _repository;

  AuthenticateUserUseCase(this._repository);

  Either<void, UserModel> authenticateUser({
    required String email,
    required String password,
  }) {
    return _repository.authenticateUser(email: email, password: password);
  }
}
