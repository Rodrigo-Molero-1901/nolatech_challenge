part of 'login_view_model.dart';

sealed class LoginNavigationViewModel {}

class HomeNavigation extends LoginNavigationViewModel {
  final HomeParams params;

  HomeNavigation({
    required this.params,
  });
}

class RegisterNavigation extends LoginNavigationViewModel {}
