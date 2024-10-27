part of '../register_page.dart';

extension _NavigationExtension on RegisterNavigationViewModel {
  void navigate(BuildContext context) {
    switch (this) {
      case HomeNavigation(:final params):
        context.pushReplacement(Routes.pathHome, extra: params);
      case LoginNavigation():
        context.pushReplacement(Routes.pathLogin);
    }
  }
}
