import 'package:agence_test/app/modules/signin/controllers/signin_controller.dart';
import 'package:agence_test/app/widgets/buttons/button_facebook.dart';
import 'package:agence_test/app/widgets/buttons/button_google.dart';
import 'package:agence_test/app/widgets/buttons/button_rectangle.dart';
import 'package:agence_test/app/widgets/buttons/button_text.dart';
import 'package:agence_test/app/widgets/inputs/custom_uncontrolled_input.dart';
import 'package:agence_test/app/widgets/layouts/layout_page/layout_page.dart';
import 'package:agence_test/app/widgets/layouts/spacer_line.dart';
import 'package:agence_test/app/widgets/loadings/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninView extends GetView<SigninController> {
  SigninView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Loading(
        show: controller.isLoading.value,
        child: LayoutPage(
          title: "Fazer Login",
          subtitle: "Use suas credenciais para acessar o aplicativo.",
          goBack: false,
          children: [
            Form(
              key: controller.formKeySignIn,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: CustomUncontrolledInput(
                      label: "Email",
                      icon: Icons.account_circle_outlined,
                      placeholder: "Informe seu e-mail",
                      controller: controller.emailController,
                      validator: (valueInput) {
                        if (valueInput!.trim().isEmpty) {
                          return 'Você precisa informar o e-mail para acessar o aplicativo.';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: CustomUncontrolledInput(
                      controller: controller.passwordController,
                      icon: Icons.lock_outline,
                      label: "Senha",
                      placeholder: "Informe a senha",
                      isSecret: true,
                      validator: (password) {
                        if (password == null || password.trim().isEmpty) {
                          return "Você precisa informar a senha para acessar o aplicativo.";
                        }
                        if (password.length < 8) {
                          return 'Digite uma senha com pelo menos 8 caracteres';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 0.0),
                    child: ButtonRectangle(
                      loading: false,
                      text: "Entrar",
                      onPress: () async {
                        FocusScope.of(context).unfocus();
                        if (controller.formKeySignIn.currentState!
                            .validate()) {}
                      },
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: ButtonText(text: "Esqueci a senha", onPress: () {}),
                  ),
                  const SpacerLine(),
                  ButtonGoogle(
                    onPress: () async {
                      controller.signinGoogle(context);
                    },
                  ),
                  ButtonFacebook(
                    onPress: () async {
                      controller.signimFacebook(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
