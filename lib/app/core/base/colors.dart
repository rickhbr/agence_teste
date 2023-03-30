import 'package:flutter/material.dart';

Map<int, Color> _accentColor = {
  50: const Color.fromRGBO(245, 130, 30, 0.1),
  100: const Color.fromRGBO(245, 130, 30, 0.2),
  200: const Color.fromRGBO(245, 130, 30, 0.3),
  300: const Color.fromRGBO(245, 130, 30, 0.4),
  400: const Color.fromRGBO(245, 130, 30, 0.5),
  500: const Color.fromRGBO(245, 130, 30, 0.6),
  600: const Color.fromRGBO(245, 130, 30, 0.7),
  700: const Color.fromRGBO(245, 130, 30, 0.8),
  800: const Color.fromRGBO(245, 130, 30, 0.9),
  900: const Color.fromRGBO(245, 130, 30, 1.1),
};

Map<int, Color> _primaryColor = {
  50: const Color.fromRGBO(19, 21, 33, 0.1),
  100: const Color.fromRGBO(19, 21, 33, 0.2),
  200: const Color.fromRGBO(19, 21, 33, 0.3),
  300: const Color.fromRGBO(19, 21, 33, 0.4),
  400: const Color.fromRGBO(19, 21, 33, 0.5),
  500: const Color.fromRGBO(19, 21, 33, 0.6),
  600: const Color.fromRGBO(19, 21, 33, 0.7),
  700: const Color.fromRGBO(19, 21, 33, 0.8),
  800: const Color.fromRGBO(19, 21, 33, 0.9),
  900: const Color.fromRGBO(19, 21, 33, 1.1),
};

abstract class CustomColors {
  static MaterialColor customPrimaryColor =
      MaterialColor(0XFF131521, _primaryColor);

  static MaterialColor customAccentColor =
      MaterialColor(0XFF131521, _accentColor);

  static Color white = const Color(0xffffffff);

  static Color primaryColor = const Color(0XFF131521);
  static Color accentColor = const Color(0XFFfab701);
  static Color focusColor = const Color(0XFFE0AA0F);
  static Color blackColor = const Color(0XFF000000);
  static Color whiteColor = const Color(0XFFFFFFFF);
  static Color primaryText = const Color.fromARGB(255, 136, 136, 136);
  static Color titleColor = const Color(0xffe8f4f9);
  static Color subTitleColor = const Color(0xffb0c0c7);
  static Color textColor = const Color(0xffe8f4f9);
  static Color inputBorderColor = const Color(0xffe8f4f9);

  static Color errorBackgroundColor = const Color(0xFFF44336);
  static Color errorTextColor = const Color.fromARGB(255, 105, 34, 29);

  static Color successBackgroundColor = const Color(0xFF4CAF50);
  static Color successTextColor = const Color.fromARGB(255, 20, 54, 21);
}
