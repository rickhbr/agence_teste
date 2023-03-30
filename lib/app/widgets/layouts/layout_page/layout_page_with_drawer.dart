import 'package:agence_test/app/core/base/colors.dart';
import 'package:agence_test/app/core/base/dimensions.dart';
import 'package:agence_test/app/core/base/images.dart';
import 'package:agence_test/app/globals/services/navigation_service.dart';
import 'package:agence_test/app/routes/app_routes.dart';
import 'package:agence_test/app/widgets/texts/subtitle.dart';
import 'package:agence_test/app/widgets/texts/title.dart';
import 'package:flutter/material.dart';

class LayoutPageWithDrawer extends StatelessWidget {
  final List<Widget> children;
  final String title;
  final String name;
  final String subtitle;
  final bool goBack;
  final dynamic Function()? onTap;

  const LayoutPageWithDrawer({
    Key? key,
    required this.children,
    required this.name,
    required this.title,
    required this.subtitle,
    this.onTap,
    this.goBack = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(""),
      ),
      drawer: Drawer(
        backgroundColor: CustomColors.primaryColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTitle(
                    text: "Menu",
                    color: CustomColors.primaryColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 32.0,
                    ),
                    child: Text(
                      "Olá, $name!",
                      style: TextStyle(
                          fontSize: 24,
                          color: CustomColors.primaryColor,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: CustomColors.accentColor,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: CustomColors.white,
              ),
              title: Subtitle(text: "Perfil"),
              onTap: () {
                NavigationService.push(PagesRoutes.blankRoute);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.shop,
                color: CustomColors.white,
              ),
              title: Subtitle(text: "Meus produtos"),
              onTap: () {
                NavigationService.push(PagesRoutes.blankRoute);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: CustomColors.white,
              ),
              title: Subtitle(text: "Configurações"),
              onTap: () {
                NavigationService.push(PagesRoutes.blankRoute);
              },
            ),
            ListTile(
                leading: Icon(
                  Icons.logout,
                  color: CustomColors.white,
                ),
                title: Subtitle(text: "Logout"),
                onTap: onTap),
          ],
        ),
      ),
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
                          Expanded(child: CustomTitle(text: title)),
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
