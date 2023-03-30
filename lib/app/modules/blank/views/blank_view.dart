import 'package:agence_test/app/core/base/jsons.dart';
import 'package:agence_test/app/widgets/layouts/layout_page/layout_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BlankView extends StatelessWidget {
  const BlankView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutPage(
        children: [Lottie.asset(AnimationJson.maintence)],
        title: "Página demonstrativa",
        subtitle: "Tela de demonstração de navegação do Drawer");
  }
}
