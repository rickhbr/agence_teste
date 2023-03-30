import 'package:agence_test/app/core/base/colors.dart';
import 'package:agence_test/app/core/base/dimensions.dart';
import 'package:agence_test/app/core/base/images.dart';
import 'package:agence_test/app/modules/home/controllers/home_controller.dart';
import 'package:agence_test/app/modules/product/views/product_view.dart';
import 'package:agence_test/app/widgets/layouts/layout_page/layout_page_with_drawer.dart';
import 'package:agence_test/app/widgets/loadings/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Loading(
        show: controller.isLoading.value,
        child: LayoutPageWithDrawer(
          name: controller.user.value.name!,
          onTap: controller.logout,
          title: "Bem vindo(a), ${controller.user.value.name!}!",
          subtitle:
              "Aproveite nossa lista de produtos disponíveis para você! :)",
          goBack: false,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (controller.isLoading.value)
                  Center(child: CircularProgressIndicator()),
                Container(
                  height: MediaQuery.of(context).size.height * 0.9,
                  child: Obx(
                    () => GridView.builder(
                      controller: controller.pageController,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemCount: controller.isAddLoading.value
                          ? controller.products.length + 10
                          : controller.products.length,
                      itemBuilder: (BuildContext context, int index) {
                        final product = controller.products[index];
                        return GestureDetector(
                          onTap: () {
                            Get.to(ProductView(
                                nomeProduto: controller.products[index]));
                          },
                          child: Card(
                            child: Column(
                              children: [
                                Image.asset(Images.productImage),
                                SizedBox(height: 10),
                                Text(
                                  product,
                                  style: GoogleFonts.manrope(
                                    color: CustomColors.primaryColor,
                                    fontSize: CustomDimensions.subtitleSize,
                                    fontWeight: CustomDimensions.subtitleWeight,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
