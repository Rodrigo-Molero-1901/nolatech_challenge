import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../common/data/models/user_model.dart';
import '../../../common/domain/repositories/auth_repository.dart';

@injectable
class RegisterUserUseCase {
  final AuthRepository _repository;

  RegisterUserUseCase(this._repository);

  Either<void, UserModel> registerUser({required UserModel userModel}) {
    return _repository.registerUser(userModel: userModel);
  }
}
