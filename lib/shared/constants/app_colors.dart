import 'package:flutter/material.dart';

abstract class _AppColors {
  static const black = Colors.black;
  static const white = Colors.white;
  static const transparent = Colors.transparent;

  static const darkLimeGreen = Color(0xFF83BC00);
  static const citrusLime = Color(0xFFAAF724);
  static const iridium = Color(0xFF3D3D3D);
  static const vampireGrey = Color(0xFF4F5154);
  static const starDust = Color(0xFF9B9C9D);
  static const whiteLilac = Color(0xFFF5F7FC);
  static const softPeach = Color(0xFFEEEFF1);
  static const navy = Color(0xFF072340);
  static const mariner = Color(0xFF346BC3);
  static const aliceBlue = Color(0xFFF4F7FC);
  static const cyanBlue = Color(0xFFEBEFF4);
}

abstract class AppContextColors {
  // Common
  static const defaultText = _AppColors.iridium;
  static const buttonText = _AppColors.white;
  static const background = _AppColors.white;

  // Button
  static const primaryButton = _AppColors.darkLimeGreen;

  // Divider
  static const divider = _AppColors.mariner;
  static const verticalDivider = _AppColors.iridium;

  // Text field
  static const textFieldLabelText = _AppColors.starDust;
  static const textFieldHintText = _AppColors.iridium;
  static const textFieldUnderline = _AppColors.starDust;

  // Welcome
  static Color registerButton = _AppColors.white.withOpacity(0.5);

  // Login
  static const forgotPasswordHintText = _AppColors.mariner;
  static const registerHintText = _AppColors.mariner;

  // Home
  static const homeHeaderGradient = [
    _AppColors.navy,
    _AppColors.darkLimeGreen,
  ];
  static const homeHeaderGradient2 = [
    _AppColors.transparent,
    _AppColors.citrusLime,
  ];
  static const homeHeaderText = _AppColors.white;
  static const homeDivider = _AppColors.cyanBlue;
  static const carouselReservationBorder = _AppColors.softPeach;

  // Reservation
  static const reservationScheduleSectionBackground = _AppColors.aliceBlue;
}
