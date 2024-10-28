part of 'home_tab_view_model.dart';

sealed class HomeTabNavigationViewModel {}

class ReservationNavigation extends HomeTabNavigationViewModel {
  final ReservationParams params;

  ReservationNavigation({
    required this.params,
  });
}
