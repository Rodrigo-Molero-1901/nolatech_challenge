part of '../welcome_page.dart';

extension _NavigationExtension on WelcomeNavigationViewModel {
  void navigate(BuildContext context) {
    switch (this) {
      case LoginNavigation():
        context.push(Routes.pathLogin);
      case RegisterNavigation():
        context.push(Routes.pathRegister);
    }
  }
}
