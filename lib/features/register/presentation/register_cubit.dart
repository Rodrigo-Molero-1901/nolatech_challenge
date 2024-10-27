import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../common/data/models/user_model.dart';
import '../../common/params/home_params.dart';
import '../domain/usecases/register_user.dart';
import 'viewmodels/register_view_model.dart';

part 'register_state.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUserUseCase _registerUserUseCase;

  RegisterCubit({
    required RegisterUserUseCase registerUserUseCase,
  })  : _registerUserUseCase = registerUserUseCase,
        super(RegisterInitial());

  void initialize() {
    _emitMain();
  }

  void _emitMain({
    RegisterNavigationViewModel? navigation,
  }) {
    emit(
      RegisterMain(
        viewModel: RegisterViewModel.fromSuccessState(
          navigation: navigation,
        ),
      ),
    );
  }

  void onRegisterTapped(
    String name,
    String phone,
    String email,
    String password,
  ) {
    if (name.isEmpty || phone.isEmpty || email.isEmpty || password.isEmpty) {
      // Might add a toast for error here
      return;
    }

    final result = _registerUserUseCase.registerUser(
      userModel: UserModel(
          name: name, phoneNumber: phone, email: email, password: password),
    );

    result.fold(
      (error) {},
      (registeredUser) {
        _emitMain(
          navigation: HomeNavigation(
            params: HomeParams(loggedUserId: registeredUser.objectId),
          ),
        );
      },
    );
  }

  void onGoToLoginTapped() {
    _emitMain(navigation: LoginNavigation());
  }
}
