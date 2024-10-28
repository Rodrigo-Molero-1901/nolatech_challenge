import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/user_model.dart';
import '../repositories/auth_repository.dart';

@injectable
class GetUserUseCase {
  final AuthRepository _repository;

  GetUserUseCase(this._repository);

  Either<void, UserModel> getUserById({required int userId}) {
    return _repository.getUserById(userId: userId);
  }
}
