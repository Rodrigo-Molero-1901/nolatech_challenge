part of '../reservation_page.dart';

extension _NavigationExtension on ReservationNavigationViewModel {
  void navigate(BuildContext context, ReservationParams params) {
    switch (this) {
      case ReservationDoneNavigation():
        params.onReserveTapped?.call();
        context.pop();
    }
  }
}
