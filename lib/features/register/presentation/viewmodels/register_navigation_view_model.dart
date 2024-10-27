part of 'register_view_model.dart';

sealed class RegisterNavigationViewModel {}

class HomeNavigation extends RegisterNavigationViewModel {
  final HomeParams params;

  HomeNavigation({
    required this.params,
  });
}

class LoginNavigation extends RegisterNavigationViewModel {}
