part of 'home_cubit.dart';

sealed class HomeState {}

class HomeInitial extends HomeState {}

class HomeMain extends HomeState {
  final HomeViewModel viewModel;

  HomeMain({
    required this.viewModel,
  });
}
