import 'package:agence_test/app/core/base/colors.dart';
import 'package:agence_test/app/core/base/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class Subtitle extends StatelessWidget {
  final String text;

  const Subtitle({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      //textAlign: TextAlign.center ,
      style: GoogleFonts.manrope(
        color: CustomColors.subTitleColor,
        fontSize: CustomDimensions.subtitleSize,
        fontWeight: CustomDimensions.subtitleWeight,
      ),
    );
  }
}
