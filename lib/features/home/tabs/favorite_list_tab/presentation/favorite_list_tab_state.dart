part of 'favorite_list_tab_cubit.dart';

sealed class FavoriteListTabState {}

class FavoriteListTabInitial extends FavoriteListTabState {}

class FavoriteListTabMain extends FavoriteListTabState {
  final FavoriteListTabViewModel viewModel;

  FavoriteListTabMain({
    required this.viewModel,
  });
}
