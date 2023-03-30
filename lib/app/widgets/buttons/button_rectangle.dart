import 'package:agence_test/app/core/base/colors.dart';
import 'package:agence_test/app/core/base/dimensions.dart';
import 'package:agence_test/app/widgets/texts/text_custom.dart';
import 'package:flutter/material.dart';

class ButtonRectangle extends StatelessWidget {
  final String text;
  final VoidCallback onPress;
  final bool loading;
  final Color? color;

  const ButtonRectangle({
    Key? key,
    required this.text,
    required this.onPress,
    this.loading = false,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: CustomDimensions.buttonHeight,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? CustomColors.accentColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              CustomDimensions.buttonBorderRadius,
            ),
          ),
        ),
        onPressed: loading ? () {} : onPress,
        child: loading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(color: Colors.white))
            : TextCustom(
                color: Colors.white,
                text: text,
                size: CustomDimensions.buttonTextSize,
                weight: FontWeight.w600,
              ),
      ),
    );
  }
}
