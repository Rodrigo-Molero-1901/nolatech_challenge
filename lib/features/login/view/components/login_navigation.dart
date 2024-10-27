part of '../login_page.dart';

extension _NavigationExtension on LoginNavigationViewModel {
  void navigate(BuildContext context) {
    switch (this) {
      case HomeNavigation(:final params):
        context.pushReplacement(Routes.pathHome, extra: params);
      case RegisterNavigation():
        context.pushReplacement(Routes.pathRegister);
    }
  }
}
