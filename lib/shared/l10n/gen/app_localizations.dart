import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_es.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('es')];

  /// No description provided for @w_login_button.
  ///
  /// In es, this message translates to:
  /// **'Iniciar sesión'**
  String get w_login_button;

  /// No description provided for @w_register_button.
  ///
  /// In es, this message translates to:
  /// **'Registrarme'**
  String get w_register_button;

  /// No description provided for @l_login_title.
  ///
  /// In es, this message translates to:
  /// **'Iniciar sesión'**
  String get l_login_title;

  /// No description provided for @l_email_field.
  ///
  /// In es, this message translates to:
  /// **'Email'**
  String get l_email_field;

  /// No description provided for @l_password_field.
  ///
  /// In es, this message translates to:
  /// **'Contraseña'**
  String get l_password_field;

  /// No description provided for @l_remember_password_check.
  ///
  /// In es, this message translates to:
  /// **'Recordar contraseña'**
  String get l_remember_password_check;

  /// No description provided for @l_forgot_password_hint.
  ///
  /// In es, this message translates to:
  /// **'¿Olvidaste tu contraseña?'**
  String get l_forgot_password_hint;

  /// No description provided for @l_login_button.
  ///
  /// In es, this message translates to:
  /// **'Iniciar sesión'**
  String get l_login_button;

  /// No description provided for @l_register_hint.
  ///
  /// In es, this message translates to:
  /// **'¿Aún no tienes cuenta?  <b>Regístrate</b>'**
  String get l_register_hint;

  /// No description provided for @r_register_title.
  ///
  /// In es, this message translates to:
  /// **'Registro'**
  String get r_register_title;

  /// No description provided for @r_name_field.
  ///
  /// In es, this message translates to:
  /// **'Nombre y apellido'**
  String get r_name_field;

  /// No description provided for @r_email_field.
  ///
  /// In es, this message translates to:
  /// **'email'**
  String get r_email_field;

  /// No description provided for @r_phone_number_field.
  ///
  /// In es, this message translates to:
  /// **'Teléfono'**
  String get r_phone_number_field;

  /// No description provided for @r_password_field.
  ///
  /// In es, this message translates to:
  /// **'Contraseña'**
  String get r_password_field;

  /// No description provided for @r_confirm_password_field.
  ///
  /// In es, this message translates to:
  /// **'Confirmar contraseña'**
  String get r_confirm_password_field;

  /// No description provided for @r_register_button.
  ///
  /// In es, this message translates to:
  /// **'Registrarme'**
  String get r_register_button;

  /// No description provided for @r_login_hint.
  ///
  /// In es, this message translates to:
  /// **'Ya tengo cuenta  <b>Iniciar sesión</b>'**
  String get r_login_hint;

  /// No description provided for @h_bottom_bar_label_1.
  ///
  /// In es, this message translates to:
  /// **'Inicio'**
  String get h_bottom_bar_label_1;

  /// No description provided for @h_bottom_bar_label_2.
  ///
  /// In es, this message translates to:
  /// **'Reservas'**
  String get h_bottom_bar_label_2;

  /// No description provided for @h_bottom_bar_label_3.
  ///
  /// In es, this message translates to:
  /// **'Favoritos'**
  String get h_bottom_bar_label_3;

  /// No description provided for @h_header_title_1.
  ///
  /// In es, this message translates to:
  /// **'Tennis'**
  String get h_header_title_1;

  /// No description provided for @h_header_title_2.
  ///
  /// In es, this message translates to:
  /// **'court'**
  String get h_header_title_2;

  /// No description provided for @h_welcome_title.
  ///
  /// In es, this message translates to:
  /// **'Hola {userFirstName}!'**
  String h_welcome_title(String userFirstName);

  /// No description provided for @h_reservations_section.
  ///
  /// In es, this message translates to:
  /// **'Canchas'**
  String get h_reservations_section;

  /// No description provided for @h_carousel_reservation_type.
  ///
  /// In es, this message translates to:
  /// **'Cancha tipo {reservationType}'**
  String h_carousel_reservation_type(String reservationType);

  /// No description provided for @h_reservations_button.
  ///
  /// In es, this message translates to:
  /// **'Reservar'**
  String get h_reservations_button;

  /// No description provided for @h_scheduled_reservation_section.
  ///
  /// In es, this message translates to:
  /// **'Reservas programadas'**
  String get h_scheduled_reservation_section;

  /// No description provided for @h_empty_scheduled_reservations.
  ///
  /// In es, this message translates to:
  /// **'¡Ups! Parece que todavía no has hecho ninguna reserva ☹️'**
  String get h_empty_scheduled_reservations;

  /// No description provided for @r_reservation_type.
  ///
  /// In es, this message translates to:
  /// **'Cancha tipo {reservationType}'**
  String r_reservation_type(String reservationType);

  /// No description provided for @r_reservation_add_instructor_label.
  ///
  /// In es, this message translates to:
  /// **'Agregar instructor'**
  String get r_reservation_add_instructor_label;

  /// No description provided for @r_reservation_set_date_time_subtitle.
  ///
  /// In es, this message translates to:
  /// **'Establecer fecha y hora'**
  String get r_reservation_set_date_time_subtitle;

  /// No description provided for @r_reservation_date_label.
  ///
  /// In es, this message translates to:
  /// **'Fecha'**
  String get r_reservation_date_label;

  /// No description provided for @r_reservation_init_time_label.
  ///
  /// In es, this message translates to:
  /// **'Hora de inicio'**
  String get r_reservation_init_time_label;

  /// No description provided for @r_reservation_end_time_label.
  ///
  /// In es, this message translates to:
  /// **'Hora de inicio'**
  String get r_reservation_end_time_label;

  /// No description provided for @r_reservation_add_comment_subtitle.
  ///
  /// In es, this message translates to:
  /// **'Agregar un comentario'**
  String get r_reservation_add_comment_subtitle;

  /// No description provided for @r_reservation_add_comment_hint.
  ///
  /// In es, this message translates to:
  /// **'Agregar un comentario...'**
  String get r_reservation_add_comment_hint;

  /// No description provided for @r_reserve_button.
  ///
  /// In es, this message translates to:
  /// **'Reservar'**
  String get r_reserve_button;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
