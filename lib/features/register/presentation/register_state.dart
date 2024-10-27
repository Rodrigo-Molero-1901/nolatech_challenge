part of 'register_cubit.dart';

sealed class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterMain extends RegisterState {
  final RegisterViewModel viewModel;

  RegisterMain({
    required this.viewModel,
  });
}
