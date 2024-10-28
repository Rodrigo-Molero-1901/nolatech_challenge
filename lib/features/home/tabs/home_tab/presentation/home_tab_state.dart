part of 'home_tab_cubit.dart';

sealed class HomeTabState {}

class HomeTabInitial extends HomeTabState {}

class HomeTabMain extends HomeTabState {
  final HomeTabViewModel viewModel;

  HomeTabMain({
    required this.viewModel,
  });
}
