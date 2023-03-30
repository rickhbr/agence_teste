import 'package:agence_test/app/core/base/colors.dart';
import 'package:agence_test/app/core/base/dimensions.dart';
import 'package:agence_test/app/widgets/texts/text_custom.dart';
import 'package:flutter/material.dart';

class ButtonImage extends StatelessWidget {
  final VoidCallback onPress;
  final Color? color;
  final bool loading;
  final String text;
  final String image;

  const ButtonImage({
    Key? key,
    required this.onPress,
    this.loading = false,
    required this.text,
    this.color,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 24.0,
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(
                  MediaQuery.of(context).size.width,
                  MediaQuery.of(context).size.height * 0.06,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    CustomDimensions.buttonBorderRadius,
                  ),
                ),
                backgroundColor: CustomColors.white,
              ),
              onPressed: loading ? () {} : onPress,
              child: loading
                  ? SizedBox(
                      height: 20,
                      width: 20,
                      child:
                          CircularProgressIndicator(color: CustomColors.white))
                  : TextCustom(
                      color: CustomColors.blackColor,
                      text: text,
                      size: CustomDimensions.buttonTextSize,
                      weight: FontWeight.w600,
                    ),
            ),
            Positioned(
                right: 0,
                bottom: 6,
                child: Image.asset(
                  image,
                  width: 50,
                  height: 40,
                )),
          ],
        ),
      ),
    );
  }
}
