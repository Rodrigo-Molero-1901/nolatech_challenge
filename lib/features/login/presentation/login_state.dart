part of 'login_cubit.dart';

sealed class LoginState {}

class LoginInitial extends LoginState {}

class LoginMain extends LoginState {
  final LoginViewModel viewModel;

  LoginMain({
    required this.viewModel,
  });
}
