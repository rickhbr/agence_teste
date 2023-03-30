import 'package:agence_test/app/core/base/colors.dart';
import 'package:agence_test/app/core/base/dimensions.dart';
import 'package:agence_test/app/widgets/texts/text_custom.dart';
import 'package:flutter/material.dart';

class ButtonText extends StatelessWidget {
  final String text;
  final VoidCallback onPress;
  final Color? color;

  const ButtonText({
    Key? key,
    required this.text,
    required this.onPress,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      child: TextCustom(
        color: color ?? CustomColors.accentColor,
        size: CustomDimensions.buttonTextSize,
        text: text,
        weight: FontWeight.w600,
      ),
    );
  }
}
