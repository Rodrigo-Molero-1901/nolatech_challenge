import 'app_localizations.dart';

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get w_login_button => 'Iniciar sesión';

  @override
  String get w_register_button => 'Registrarme';

  @override
  String get l_login_title => 'Iniciar sesión';

  @override
  String get l_email_field => 'Email';

  @override
  String get l_password_field => 'Contraseña';

  @override
  String get l_remember_password_check => 'Recordar contraseña';

  @override
  String get l_forgot_password_hint => '¿Olvidaste tu contraseña?';

  @override
  String get l_login_button => 'Iniciar sesión';

  @override
  String get l_register_hint => '¿Aún no tienes cuenta?  <b>Regístrate</b>';

  @override
  String get r_register_title => 'Registro';

  @override
  String get r_name_field => 'Nombre y apellido';

  @override
  String get r_email_field => 'email';

  @override
  String get r_phone_number_field => 'Teléfono';

  @override
  String get r_password_field => 'Contraseña';

  @override
  String get r_confirm_password_field => 'Confirmar contraseña';

  @override
  String get r_register_button => 'Registrarme';

  @override
  String get r_login_hint => 'Ya tengo cuenta  <b>Iniciar sesión</b>';

  @override
  String get h_header_title_1 => 'Tennis';

  @override
  String get h_header_title_2 => 'court';

  @override
  String h_welcome_title(String userFirstName) {
    return 'Hola $userFirstName!';
  }

  @override
  String get h_reservations_section => 'Canchas';

  @override
  String h_reservations_type(String reservationType) {
    return 'Cancha tipo $reservationType';
  }

  @override
  String get h_reservations_button => 'Reservar';

  @override
  String get h_scheduled_reservation_section => 'Reservas programadas';

  @override
  String get h_empty_scheduled_reservations =>
      '¡Ups! Parece que todavía no has hecho ninguna reserva ☹️';
}
