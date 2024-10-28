part of 'welcome_cubit.dart';

sealed class WelcomeState {}

class WelcomeInitial extends WelcomeState {}

class WelcomeMain extends WelcomeState {
  final WelcomeViewModel viewModel;

  WelcomeMain({
    required this.viewModel,
  });
}
