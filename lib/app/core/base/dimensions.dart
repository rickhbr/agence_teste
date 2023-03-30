import 'package:flutter/cupertino.dart';

abstract class CustomDimensions {
  static double paddingPage = 30.0;

  static double buttonHeight = 50;
  static double buttonBorderRadius = 10;
  static double buttonTextSize = 16;

  static double inputHeight = 45;
  static double inputFontLabel = 16;
  static double inputBorderRadius = 10;
  static double inputTextSize = 14;

  static double iconSize = 25;

  static double titleSize = 25;
  static FontWeight titleWeight = FontWeight.w400;

  static double subtitleSize = 17;
  static FontWeight subtitleWeight = FontWeight.w500;

  static double textSize = 14;

  static double legendTextSize = 12;

  static double heightScreenWithKeyboard(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    final heightKeyboard = MediaQuery.of(context).viewInsets.bottom;

    return sizeScreen.height - heightKeyboard;
  }

  static Size sizeScreen(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    return sizeScreen;
  }
}
