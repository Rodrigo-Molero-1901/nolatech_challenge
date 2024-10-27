import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../common/params/home_params.dart';
import '../domain/usecases/authenticate_user.dart';
import 'viewmodels/login_view_model.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final AuthenticateUserUseCase _authenticateUserUseCase;

  LoginCubit({
    required AuthenticateUserUseCase authenticateUserUseCase,
  })  : _authenticateUserUseCase = authenticateUserUseCase,
        super(LoginInitial());

  void initialize() {
    _emitMain();
  }

  void _emitMain({
    LoginNavigationViewModel? navigation,
  }) {
    emit(
      LoginMain(
        viewModel: LoginViewModel.fromSuccessState(
          navigation: navigation,
        ),
      ),
    );
  }

  void onLoginTapped(
    String email,
    String password,
  ) {
    if (email.isEmpty || password.isEmpty) {
      // Might add a toast for error here
      return;
    }

    final result = _authenticateUserUseCase.authenticateUser(
      email: email,
      password: password,
    );

    result.fold(
      (error) {},
      (authenticatedUser) {
        _emitMain(
          navigation: HomeNavigation(
            params: HomeParams(loggedUserId: authenticatedUser.objectId),
          ),
        );
      },
    );
  }

  void onGoToRegisterTapped() {
    _emitMain(navigation: RegisterNavigation());
  }
}
