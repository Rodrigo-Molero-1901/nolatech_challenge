part of 'welcome_view_model.dart';

sealed class WelcomeNavigationViewModel {}

class LoginNavigation extends WelcomeNavigationViewModel {}

class RegisterNavigation extends WelcomeNavigationViewModel {}
