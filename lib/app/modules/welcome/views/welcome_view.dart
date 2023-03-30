import 'package:agence_test/app/core/base/colors.dart';
import 'package:agence_test/app/core/base/images.dart';
import 'package:agence_test/app/globals/services/navigation_service.dart';
import 'package:agence_test/app/modules/welcome/controllers/welcome_controller.dart';
import 'package:agence_test/app/routes/app_routes.dart';
import 'package:agence_test/app/widgets/buttons/button_image.dart';
import 'package:agence_test/app/widgets/buttons/button_rectangle.dart';
import 'package:agence_test/app/widgets/texts/subtitle.dart';
import 'package:agence_test/app/widgets/texts/title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeView extends GetView<WelcomeController> {
  WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.primaryColor,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Image.asset(
                        Images.icWelcome,
                        width: 180.0,
                      ),
                      SizedBox(
                        height: 32.0,
                      ),
                      CustomTitle(
                          text: "Seja bem vindo ao meu teste da Agence!"),
                      SizedBox(
                        height: 24.0,
                      ),
                      Subtitle(
                          text:
                              "Agradeço pela oportunidade de estar realizando o processo seletivo com vocês, abaixo meu perfil e o código do projeto:"),
                      SizedBox(
                        height: 24.0,
                      ),
                      _buildButtons(context),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Column(
      children: [
        ButtonImage(
          onPress: () {
            controller.launchLinkedin();
          },
          text: "Linkedin",
          image: Images.icLinkedin,
        ),
        ButtonImage(
          onPress: () {
            controller.launchCodeProject();
          },
          text: "Código do projeto",
          image: Images.icGit,
        ),
        SizedBox(
          height: 24.0,
        ),
        SizedBox(
          height: 32.0,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          child: ButtonRectangle(
            text: 'Continuar',
            onPress: () {
              NavigationService.push(PagesRoutes.signInRoute);
            },
          ),
        )
      ],
    );
  }
}
