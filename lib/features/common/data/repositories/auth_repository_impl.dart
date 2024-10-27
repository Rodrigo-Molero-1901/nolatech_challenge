import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:nolatech_challenge/core/service/manager/api_manager.dart';

import '../../domain/repositories/auth_repository.dart';
import '../models/user_model.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final ApiManager _apiManager;

  AuthRepositoryImpl({
    required ApiManager apiManager,
  }) : _apiManager = apiManager;

  @override
  Either<void, UserModel> authenticateUser({
    required String email,
    required String password,
  }) {
    final response = _apiManager.authApiManager.authenticateUser(
      email: email,
      password: password,
    );
    return response.fold(
      (error) => Left(error),
      (authenticatedUser) => Right(authenticatedUser.toModel()),
    );
  }

  @override
  Either<void, UserModel> registerUser({required UserModel userModel}) {
    final response = _apiManager.authApiManager.registerUser(
      userModel: userModel,
    );
    return response.fold(
      (error) => Left(error),
      (registeredUser) => Right(registeredUser.toModel()),
    );
  }

  @override
  Either<void, UserModel> getUserById({required int userId}) {
    final response = _apiManager.authApiManager.getUserById(userId: userId);
    return response.fold(
      (error) => Left(error),
      (user) => Right(user.toModel()),
    );
  }
}
