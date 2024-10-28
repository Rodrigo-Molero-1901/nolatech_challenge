part of 'home_view_model.dart';

sealed class HomeNavigationViewModel {}

class ReservationNavigation extends HomeNavigationViewModel {
  final ReservationParams params;

  ReservationNavigation({
    required this.params,
  });
}
