import 'package:agence_test/app/core/base/colors.dart';
import 'package:agence_test/app/core/base/dimensions.dart';
import 'package:agence_test/app/core/base/images.dart';
import 'package:agence_test/app/globals/services/navigation_service.dart';
import 'package:agence_test/app/widgets/texts/subtitle.dart';
import 'package:agence_test/app/widgets/texts/title.dart';
import 'package:flutter/material.dart';

class LayoutPage extends StatelessWidget {
  final List<Widget> children;
  final String title;
  final String subtitle;
  final bool goBack;

  const LayoutPage({
    Key? key,
    required this.children,
    required this.title,
    required this.subtitle,
    this.goBack = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: EdgeInsets.only(
                  left: CustomDimensions.paddingPage,
                  top: CustomDimensions.paddingPage / 5,
                  right: CustomDimensions.paddingPage,
                  bottom: 0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 20.0,
                        top: 10.0,
                      ),
                      child: Image.asset(
                        Images.icAgence,
                        width: 100,
                        height: 80,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          if (goBack)
                            IconButton(
                              constraints: const BoxConstraints(),
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                NavigationService.goBack();
                              },
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: CustomColors.accentColor,
                              ),
                            ),
                          CustomTitle(text: title),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30.0),
                      child: Subtitle(text: subtitle),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: children,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
