part of '../home_page.dart';

extension _NavigationExtension on HomeNavigationViewModel {
  void navigate(BuildContext context) {
    switch (this) {
      case ReservationNavigation(:final params):
        context.push(Routes.pathReservation, extra: params);
    }
  }
}
