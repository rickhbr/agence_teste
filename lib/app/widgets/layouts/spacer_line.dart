import 'package:agence_test/app/core/base/colors.dart';
import 'package:flutter/material.dart';

class SpacerLine extends StatelessWidget {
  const SpacerLine({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(
        top: 24.0,
        bottom: 24.0,
      ),
      child: SizedBox(
        width: width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: width * 0.35,
              height: 1,
              color: Colors.white,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              " OU ",
              style: TextStyle(color: CustomColors.accentColor),
            ),
            const SizedBox(
              width: 8,
            ),
            Container(
              width: width * 0.35,
              height: 1,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
