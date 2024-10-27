part of '../home_page.dart';

extension _NavigationExtension on HomeNavigationViewModel {
  void navigate(BuildContext context) {
    switch (this) {
      case ReservationNavigation():
        context.pushReplacement(Routes.pathHome);
    }
  }
}
