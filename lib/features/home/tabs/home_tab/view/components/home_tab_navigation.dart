part of '../home_tab_page.dart';

extension _NavigationExtension on HomeTabNavigationViewModel {
  void navigate(BuildContext context) {
    switch (this) {
      case ReservationNavigation(:final params):
        context.push(Routes.pathReservation, extra: params);
    }
  }
}
