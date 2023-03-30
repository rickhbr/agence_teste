import 'package:agence_test/app/core/base/colors.dart';
import 'package:agence_test/app/widgets/texts/text_custom.dart';
import 'package:flutter/material.dart';

abstract class Toast {
  static void showToast({
    required BuildContext context,
    bool loading = false,
    String errorMessage = "",
    bool error = true,
    required String text,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: error ? Colors.red.shade300 : Colors.green.shade300,
        content: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              error ? Icons.error_outline_outlined : Icons.check_outlined,
              color: error
                  ? CustomColors.errorTextColor
                  : CustomColors.successTextColor,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: TextCustom(
                  text: text,
                  color: error
                      ? CustomColors.errorTextColor
                      : CustomColors.successTextColor,
                  size: 16,
                  weight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
